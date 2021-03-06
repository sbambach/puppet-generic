# Author: Kumina bv <support@kumina.nl>

# Class: munin::client
#
# Actions:
#  Undocumented
#
# Depends:
#  Undocumented
#  gen_puppet
#
class munin::client {
  include munin::setup
  define plugin($ensure='present', $script_path='/usr/share/munin/plugins', $script=false) {
    if $script {
      $plugin_path = "$script_path/$script"
    } else {
      $plugin_path = "$script_path/$name"
    }
    file { "/etc/munin/plugins/$name":
      ensure => $ensure ? {
        'present' => $plugin_path,
        'absent' => 'absent',
      },
      notify => Service["munin-node"],
      require => Package["munin-node"],
    }
  }

  define plugin::config($content, $section=false, $ensure='present') {
    file { "/etc/munin/plugin-conf.d/$name":
      ensure => $ensure,
      content => $section ? {
        false => "[${name}]\n${content}\n",
        default => "[${section}]\n${content}\n",
      },
      require => Package["munin-node"],
      notify => Service["munin-node"],
    }
  }

  package { ["munin-node",'munin-common']:
    ensure => latest;
  }

  if versioncmp($lsbdistrelease,"5.0") >= 0 { # in Lenny and above we have the extra-plugins in a package
    if versioncmp($lsbdistrelease, "6") < 0 { # in lenny we want our own package
      gen_apt::preference { "munin-plugins-extra":
        repo => "lenny-kumina";
      }
    }

    package { ["munin-plugins-extra", "munin-plugins-kumina"]:
      ensure => latest;
    }
  }

  # Munin node configuration
  file { "/etc/munin/munin-node.conf":
    content => template("munin/client/munin-node.conf"),
    require => Package["munin-node"],
  }

  service { "munin-node":
    subscribe => File["/etc/munin/munin-node.conf"],
    require => [Package["munin-node"], File["/etc/munin/munin-node.conf"]],
    hasrestart => true,
    ensure => running,
  }

  file {  "/usr/local/share/munin":
    ensure => directory,
    group => "staff";
  }

  # This makes sure the plugins directory only contains files we've actually deployed
  file { "/etc/munin/plugins":
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    require => Package["munin-node"];
  }

  include munin::client::default_plugins
}

# Class: munin::server
#
# Actions:
#  Undocumented
#
# Depends:
#  Undocumented
#  gen_puppet
#
class munin::server {
  package { "munin":
    ensure => installed,
  }

  file { "/etc/munin/munin.conf":
    content => template("munin/server/munin.conf"),
    require => Package["munin"],
  }

  # Needed when munin-graph runs as a CGI script
  package { "libdate-manip-perl":
    ensure => installed,
  }

  file {
    "/var/log/munin":
      ensure => directory,
      owner => "munin",
      mode => 771;
    "/var/log/munin/munin-graph.log":
      owner => "munin",
      group => "www-data",
      mode  => 660;
    "/etc/logrotate.d/munin":
      content => template("munin/server/logrotate.d/munin");
  }
}

# Class: munin::client::default_plugins
#
# Actions:
#  Setup the plugins that Munin wants by default
#
# Depends:
#  gen_puppet
#  munin::client::plugin
#
class munin::client::default_plugins {
  include "munin::client::default_plugins::${lsbdistcodename}"

  # Use the fact interfaces for setting up interfaces.
  $ifs = split($interfaces, ",")
  munin::client::setup_interface { $ifs:; }
}

class munin::client::default_plugins::lenny {
  munin::client::plugin {
    "df_inode":;
    "vmstat":;
    "load":;
    "forks":;
    "swap":;
    "processes":;
    "open_inodes":;
    "irqstats":;
    "iostat":;
    "memory":;
    "interrupts":;
    "open_files":;
    "entropy":;
    "cpu":;
    "df":;
  }
}

class munin::client::default_plugins::squeeze {
  munin::client::plugin {
    "df_inode":;
    "vmstat":;
    "load":;
    "forks":;
    "swap":;
    "processes":;
    "open_inodes":;
    "irqstats":;
    "iostat":;
    "memory":;
    "interrupts":;
    "open_files":;
    "entropy":;
    "cpu":;
    "df":;
    "diskstats":;
    "fw_conntrack":;
    "fw_forwarded_local":;
    "fw_packets":;
    "iostat_ios":;
    "proc_pri":;
    "threads":;
    "uptime":;
    "users":;
  }
}

class munin::setup {
  if $lsbdistcodename == "squeeze" {
    gen_apt::preference { ["munin","munin-common","munin-doc","munin-java-plugins","munin-node","munin-plugins-core","munin-plugins-extra","munin-plugins-java"]:
      repo => "squeeze-kumina";
    }

    package {'munin-plugins-core':
      ensure => latest;
   }
  }
}

# Define: munin::client::setup_interface
#
# Actions:
#  Adds plugins to munin for a specific interface
#
# Depends:
#  gen_puppet
#  munin::client::plugin
#
define munin::client::setup_interface {
  # We never want to setup stuff for lo, but this define is probably
  # called via munin::client::setup_interfaces { $interfaces:; }
  if $name != "lo" {
    munin::client::plugin {
      "if_${name}":
        script => "if_";
      "if_err_${name}":
        script => "if_err_";
    }
  }
}
