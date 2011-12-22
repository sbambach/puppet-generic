# Author: Kumina bv <support@kumina.nl>

# Define: kservice
#
# Parameters:
#  hasreload
#    Defines if the service has a reload option, can be set to the command to use for reloads
#  hasrestart
#    Defines if the service has a restart option, can be set to the command to use for restarts
#  hasstatus
#    Defines if the service has a status option
#  ensure
#    Defines whether the service should be running or not
#  enable
#    Defines whether the service should be started at boot, defaults to true
#  package
#    If defined sets the package to install
#  pensure
#    The ensure for the kpackage
#
# Actions:
#  Install a package, starts the service and creates a reload exec.
#
# Depends:
#  gen_puppet
#
define kservice ($ensure="running", $hasreload=true, $hasrestart=true, $hasstatus=true, $enable=true, $package=false, $pensure="present", $pattern=false) {
  $package_name = $package ? {
    false   => $name,
    default => $package,
  }

  kpackage { $package_name:
    ensure => $pensure; }

  service { $name:
    ensure     => $ensure ? {
      "undef" => undef,
      default => $ensure,
    },
    hasrestart => $hasrestart ? {
      true    => true,
      default => false,
    },
    hasstatus  => $pattern ? {
      false   => $hasstatus,
      default => false,
    },
    enable     => $enable,
    pattern    => $pattern ? {
      false   => undef,
      default => $pattern,
    },
    require    => Kpackage[$package_name];
  }

  if $hasreload {
    if $lsbmajdistrelease < 6 {
      exec { "reload-${name}":
        command     => $hasreload ? {
          true    => "/etc/init.d/${name} reload",
          default => $hasreload,
        },
        refreshonly => true;
      }
    } else {
      exec { "reload-${name}":
        command     => $hasreload ? {
          true    => "/usr/sbin/service ${name} reload",
          default => $hasreload,
        },
        refreshonly => true;
      }
    }
  } else {
    exec { "reload-${name}":
      command     => "/bin/true",
      notify      => Service[$name],
      refreshonly => true;
    }
  }

  if $hasrestart {
    if $lsbmajdistrelease < 6 {
      exec { "restart-${name}":
        command     => $hasrestart ? {
          true    => "/etc/init.d/${name} restart",
          default => $hasrestart,
        },
        refreshonly => true;
      }
    } else {
      exec { "restart-${name}":
        command     => $hasrestart ? {
          true    => "/usr/sbin/service ${name} restart",
          default => $hasrestart,
        },
        refreshonly => true;
      }
    }
  } else {
    exec { "restart-${name}":
      command     => "/bin/true",
      notify      => Service[$name],
      refreshonly => true;
    }
  }
}
