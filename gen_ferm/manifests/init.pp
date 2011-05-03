class gen_ferm {
	include gen_puppet::concat

	kfile { "/var/lib/puppet/concat/_etc_ferm_ferm.conf":
		ensure  => absent,
		force   => true;
	}

	interface { ["lo_v46"]:
		action => "ACCEPT";
	}

	modstate {
		"INVALID_v46":;
		"ESTABLISHED_v46":
			state  => "ESTABLISHED",
			action => "ACCEPT";
		"RELATED_v46":
			state  => "RELATED",
			action => "ACCEPT";
	}

	chain {
		["INPUT_v46","FORWARD_v46"]:;
		"OUTPUT_v46":
			policy => "ACCEPT";
	}

	table { ["filter_v46"]:; }

	@table { ["mangle_v4","mangle_v6","nat_v4","nat_v6"]:; }

	kpackage { ["ferm","libnet-dns-perl"]:
		ensure => latest; }

	exec { "reload-ferm":
		command     => "/etc/init.d/ferm reload",
		subscribe   => File["/etc/ferm/ferm.conf"],
		refreshonly => true;
	}

	concat { "/etc/ferm/ferm.conf":
		owner            => "root",
		group            => "adm",
		mode             => "644",
		remove_fragments => false;
	}

	define rule($prio=500, $interface=false, $outerface=false, $saddr=false, $daddr=false, $proto=false, $icmptype=false, $sport=false, $dport=false, $action=DROP, $rejectwith=false, $table=filter, $chain=INPUT, $ensure=present) {
		$real_name = regsubst($name,'^(.*)_(.*?)$','\1')
		$sanitized_name = regsubst($real_name, '[^a-zA-Z0-9\-_]', '_', 'G')
		$ip_proto = regsubst($name,'^(.*)_(.*?)$','\2')
		$saddr_is_ip = $saddr ? {
			/^(! )?\d+\.\d+\.\d+\.\d+\/?\d*$/ => "ipv4",
			/^(! )?.*:.*:.*\/?d*$/            => "ipv6",
			default                           => false,
		}
		$daddr_is_ip = $daddr ? {
			/^(! )?\d+\.\d+\.\d+\.\d+\/?\d*$/ => "ipv4",
			/^(! )?.*:.*:.*\/?d*$/            => "ipv6",
			default                           => false,
		}

		if $ip_proto == "v46" or $ip_proto == $name {
			rule { ["${real_name}_v4","${real_name}_v6"]:
				prio       => $prio,
				interface  => $interface,
				outerface  => $outerface,
				saddr      => $saddr,
				daddr      => $daddr,
				proto      => $proto,
				icmptype   => $icmptype,
				sport      => $sport,
				dport      => $dport,
				action     => $action,
				rejectwith => $rejectwith,
				table      => $table,
				chain      => $chain,
				ensure     => $ensure;
			}
		} else {
			fermfile { "${ip_proto}_${table}_${chain}_${prio}_${sanitized_name}":
				content => $ip_proto ? {
					"v4" => template("ferm/rule_v4"),
					"v6" => template("ferm/rule_v6"),
				},
				ensure  => $ensure,
				require => [Chain["${chain}_${ip_proto}"],Exec["reload-ferm"]];
			}
		}
	}

	define interface($comment=false, $action=DROP, $table=filter, $chain=INPUT) {
		$real_name = regsubst($name,'^(.*)_(.*)$','\1')
		$sanitized_name = regsubst($real_name, '[^a-zA-Z0-9\-_]', '_', 'G')
		$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

		if $ip_proto == "v46" or $ip_proto == $name {
			interface { ["${real_name}_v4","${real_name}_v6"]:
				comment => $comment,
				action  => $action,
				table   => $table,
				chain   => $chain;
			}
		} else {
			fermfile { "${ip_proto}_${table}_${chain}_0002_${real_name}":
				content => template("ferm/interface"),
				require => [Chain["${chain}_${ip_proto}"],Exec["reload-ferm"]];
			}
		}
	}

	define modstate($comment=false, $table=filter, $chain=INPUT, $state=INVALID, $action=DROP) {
		$real_name = regsubst($name,'^(.*)_(.*)$','\1')
		$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

		if $ip_proto == "v46" or $ip_proto == $name {
			modstate { ["${real_name}_v4","${real_name}_v6"]:
				comment => $comment,
				table   => $table,
				chain   => $chain,
				state   => $state,
				action  => $action;
			}
		} else {
			fermfile { "${ip_proto}_${table}_${chain}_0001_${real_name}":
				content => template("ferm/modstate"),
				require => [Chain["${chain}_${ip_proto}"],Exec["reload-ferm"]];
			}
		}
	}

	define chain($policy=DROP, $table=filter) {
		$real_name = regsubst($name,'^(.*)_(.*)$','\1')
		$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

		if $ip_proto == "v46" or $ip_proto == $name {
			chain { ["${real_name}_v4","${real_name}_v6"]:
				policy => $policy,
				table  => $table;
			}
		} else {
			fermfile {
				"${ip_proto}_${table}_${real_name}":
					content => "\tchain ${real_name} {",
					require => Table["${table}_${ip_proto}"];
				"${ip_proto}_${table}_${real_name}_zzzz":
					content => "\t}",
					require => Table["${table}_${ip_proto}"];
			}
			if $policy {
				fermfile { "${ip_proto}_${table}_${real_name}_0000":
					content => "\t\tpolicy ${policy};",
					require => Table["${table}_${ip_proto}"];
				}
			}
		}
	}

	define table() {
		$real_name = regsubst($name,'^(.*)_(.*)$','\1')
		$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

		if $ip_proto == "v46" or $ip_proto == $name {
			table { ["${real_name}_v4","${real_name}_v6"]:; }
		} else {
			fermfile {
				"${ip_proto}_${real_name}":
					content => $ip_proto ? {
						"v4" => "table ${real_name} {",
						"v6" => "domain ip6 table ${real_name} {",
					};
				"${ip_proto}_${real_name}_zzzz":
					content => "}";
			}
		}
	}

	define fermfile($content, $ensure=present) {
		kbp_concat::add_content { $name:
			content => $content,
			target  => "/etc/ferm/ferm.conf",
			ensure  => $ensure;
		}
	}
}