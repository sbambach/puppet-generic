# Author: Kumina bv <support@kumina.nl>

# Class: gen_haproxy
#
# Parameters:
#	loadbalanced
#		Undocumented
#
# Actions:
#	Undocumented
#
# Depends:
#	Undocumented
#	gen_puppet
#
class gen_haproxy ($loadbalanced=false){
	kpackage { ["haproxy"]:; }

	service { "haproxy":
		ensure     => $loadbalanced ? {
			false   => "running",
			default => undef,
		},
		enable     => true,
		hasstatus  => true,
		hasrestart => true,
		require    => Kpackage["haproxy"],
	}

	kfile {
		"/etc/default/haproxy":
			content  => "ENABLED=1\n",
			notify  => Service["haproxy"],
			require => Kpackage["haproxy"];
	}

	concat { "/etc/haproxy/haproxy.cfg" :; }

	define proxyconfig ($order, $content) {
		concat::add_content { "${name}":
			order => $order,
			content => $content,
			target => "/etc/haproxy/haproxy.cfg";
		}
	}

	proxyconfig {
		"globals":
			order   => 10,
			content => template("gen_haproxy/global.erb");
		"defaults":
			order   => 15,
			content => template("gen_haproxy/defaults.erb");
	}

	define site ($listenaddress, $port=80, $cookie=false, $options=false, $server_options=false) {
		proxyconfig { "site_${name}":
			order => 20,
			content => template("gen_haproxy/site.erb");
		}
	}
}