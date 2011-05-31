class gen_ferm {
	include gen_puppet::concat

	kfile {
		"/var/lib/puppet/concat/_etc_ferm_ferm.conf_new":
			ensure  => absent,
			recurse => true,
			purge   => true,
			force   => true;
		"/etc/ferm/ferm.conf_new":
			ensure => absent;
	}

	kpackage { "ferm":
		ensure => latest;
	}

	exec { "reload-ferm":
		command     => "/etc/init.d/ferm reload",
		require     => Kpackage["ferm"],
		refreshonly => true;
	}

	concat { "/etc/ferm/ferm.conf":
		owner            => "root",
		group            => "adm",
		mode             => "644",
		remove_fragments => false,
		notify           => Exec["reload-ferm"],
		require          => Kpackage["ferm"];
	}

	rule { "Accept local traffic":
		interface => "lo",
		action    => "ACCEPT";
	}

	mod {
		"INVALID":
			value => "INVALID";
		"ESTABLISHED":
			value  => "(ESTABLISHED RELATED)",
			action => "ACCEPT";
	}

	realize Chain["OUTPUT_v4","OUTPUT_v6"]

	@chain {
		["INPUT_v4","INPUT_v6","FORWARD_v4","FORWARD_v6"]:
			policy => "DROP";
		["OUTPUT_v4","OUTPUT_v6"]:
			policy => "ACCEPT";
	}

	@table { ["filter_v4","filter_v6","mangle_v4","mangle_v6","nat_v4","nat_v6"]:; }

	kpackage { "libnet-dns-perl":; }
}

define gen_ferm::rule($prio=500, $interface=false, $outerface=false, $saddr=false, $daddr=false, $proto=false, $icmptype=false, $sport=false, $dport=false, $jump=false, $action=DROP, $table=filter, $chain=INPUT, $ensure=present) {
	$real_name = regsubst($name,'^(.*)_(.*?)$','\1')
	$sanitized_name = regsubst($real_name, '[^a-zA-Z0-9\-_]', '_', 'G')
	$ip_proto = regsubst($name,'^(.*)_(.*?)$','\2')
	$saddr_is_ip = $saddr ? {
		/(! )?\d+\.\d+\.\d+\.\d+\/?\d*/ => "ipv4",
		/(! )?.*:.*:.*\/?d*/            => "ipv6",
		default                         => false,
	}
	$daddr_is_ip = $daddr ? {
		/(! )?\d+\.\d+\.\d+\.\d+\/?\d*/ => "ipv4",
		/(! )?.*:.*:.*\/?d*/            => "ipv6",
		default                         => false,
	}

	if $ip_proto == "v46" or $ip_proto == $name {
		rule { ["${real_name}_v4","${real_name}_v6"]:
			prio      => $prio,
			interface => $interface,
			outerface => $outerface,
			saddr     => $saddr,
			daddr     => $daddr,
			proto     => $proto,
			icmptype  => $icmptype,
			sport     => $sport,
			dport     => $dport,
			jump      => $jump,
			action    => $action,
			table     => $table,
			chain     => $chain,
			ensure    => $ensure;
		}
	} elsif ($ip_proto=="v4" and ! ($saddr_is_ip=="ipv6") and ! ($daddr_is_ip=="ipv6")) or ($ip_proto=="v6" and ! ($saddr_is_ip=="ipv4") and ! ($daddr_is_ip=="ipv4")) {
		realize Table["${table}_${ip_proto}"]
		realize Chain["${chain}_${ip_proto}"]
		fermfile { "${ip_proto}_${table}_${chain}_${prio}_${sanitized_name}":
			content => $ip_proto ? {
				"v4" => template("gen_ferm/rule_v4"),
				"v6" => template("gen_ferm/rule_v6"),
			},
			ensure  => $ensure,
			require => Chain["${chain}_${ip_proto}"];
		}
	}
}

define gen_ferm::mod($comment=false, $table=filter, $chain=INPUT, $mod=state, $param=state, $value=false, $action=DROP) {
	$real_name = regsubst($name,'^(.*)_(.*)$','\1')
	$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

	if $ip_proto == "v46" or $ip_proto == $name {
		mod { ["${real_name}_v4","${real_name}_v6"]:
			comment => $comment,
			table   => $table,
			chain   => $chain,
			mod     => $mod,
			param   => $param,
			value   => $value,
			action  => $action;
		}
	} else {
		realize Table["${table}_${ip_proto}"]
		realize Chain["${chain}_${ip_proto}"]
		fermfile { "${ip_proto}_${table}_${chain}_0001_${real_name}":
			content => template("gen_ferm/mod"),
			require => Chain["${chain}_${ip_proto}"];
		}
	}
}

define gen_ferm::chain($policy=false, $table=filter) {
	$real_name = regsubst($name,'^(.*)_(.*)$','\1')
	$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

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

define gen_ferm::table() {
	$real_name = regsubst($name,'^(.*)_(.*)$','\1')
	$ip_proto = regsubst($name,'^(.*)_(.*)$','\2')

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

define gen_ferm::fermfile($content, $ensure=present) {
	kbp_concat::add_content { $name:
		content => $content,
		target  => "/etc/ferm/ferm.conf",
		ensure  => $ensure;
	}
}