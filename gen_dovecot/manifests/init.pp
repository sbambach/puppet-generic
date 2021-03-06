# Author: Kumina bv <support@kumina.nl>

# Class: gen_dovecot::common
#
# Actions:
#  Basic Dovecot installation
#
# Depends:
#  gen_puppet
#
class gen_dovecot::common {
  kservice { 'dovecot':
    package => 'dovecot-common';
  }

  user { 'dovecot-auth':
    comment => 'Dovecot mail server',
    gid     => 'nogroup',
    uid     => 200,
    shell   => '/bin/false',
    home    => '/usr/lib/dovecot';
  }
}

# Class: gen_dovecot::imap
#
# Actions:
#  Basic Dovecot-imapd installation
#
# Depends:
#  gen_puppet
#
class gen_dovecot::imap {
  include gen_dovecot::common

  package { 'dovecot-imapd':
    require => Package['dovecot-common'];
  }
}
