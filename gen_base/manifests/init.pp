# Author: Kumina bv <support@kumina.nl>

# Class: gen_base::abswrap
#
# Actions:
#  Install abswrap
#
# Depends:
#  gen_puppet
#
class gen_base::abswrap {
  package { "abswrap":
    ensure => latest;
  }
}

# Class: gen_base::ant
#
# Actions:
#  Install ant
#
# Depends:
#  gen_puppet
#
class gen_base::ant {
  package { "ant":
    ensure => latest;
  }
}

# Class: gen_base::apache2_mpm_prefork
#
# Actions:
#  Install apache2-mpm-prefork
#
# Depends:
#  gen_puppet
#
class gen_base::apache2_mpm_prefork {
  package { "apache2-mpm-prefork":
    ensure => latest;
  }
}

# Class: gen_base::apache2_mpm_worker
#
# Actions:
#  Install apache2-mpm-worker
#
# Depends:
#  gen_puppet
#
class gen_base::apache2_mpm_worker {
  package { "apache2-mpm-worker":
    ensure => latest;
  }
}

# Class: gen_base::archive_pmacct_data
#
# Actions:
#  Install archive-pmacct-data
#
# Depends:
#  gen_puppet
#
class gen_base::archive_pmacct_data {
  package { "archive-pmacct-data":
    ensure => latest;
  }
}

# Class: gen_base::arj
#
# Actions:
#  Install arj
#
# Depends:
#  gen_puppet
#
class gen_base::arj {
  package { "arj":
    ensure => latest;
  }
}

# Class: gen_base::libaugeas-ruby
#
# Actions:
#  Install augeas and it's lenses
#
# Depends:
#  gen_puppet
#
class gen_base::augeas {
  package { ["libaugeas-ruby", "augeas-lenses","libaugeas-ruby1.8","libaugeas0","augeas-tools"]:
    ensure => latest,
    notify => Exec["reload-puppet"];
  }
}

# Class: gen_base::backup-scripts
#
# Actions:
#  Install backup-scripts
#
# Depends:
#  gen_puppet
#
class gen_base::backup-scripts {
  package { "backup-scripts":
    ensure => latest;
  }
}

# Class: gen_base::base-files
#
# Actions:
#  Install base-files
#
# Depends:
#  gen_puppet
#
class gen_base::base-files {
  package { "base-files":
    ensure => latest;
  }
}

# Class: gen_base::bridge-utils
#
# Actions:
#  Install bridge-utils
#
# Depends:
#  gen_puppet
#
class gen_base::bridge-utils {
  package { "bridge-utils":
    ensure => latest;
  }
}

# Class: gen_base::bsdtar
#
# Actions:
#  Install bsdtar
#
# Depends:
#  gen_puppet
#
class gen_base::bsdtar {
  package { "bsdtar":
    ensure => latest;
  }
}

# Class: gen_base::bzip2
#
# Actions:
#  Install bzip2
#
# Depends:
#  gen_puppet
#
class gen_base::bzip2 {
  package { "bzip2":
    ensure => latest;
  }
}

# Class: gen_base::cabextract
#
# Actions:
#  Install cabextract
#
# Depends:
#  gen_puppet
#
class gen_base::cabextract {
  package { "cabextract":
    ensure => latest;
  }
}

# Class: gen_base::curl
#
# Actions:
#  Install curl
#
# Depends:
#  gen_puppet
#
class gen_base::curl {
  include gen_base::libcurl3
  package { "curl":
    ensure => latest;
  }
}

# Class: gen_base::dnsutils
#
# Actions:
#  Install dnsutils
#
# Depends:
#  gen_puppet
#
class gen_base::dnsutils {
  package { "dnsutils":
    ensure => latest;
  }
}

# Class: gen_base::dpkg
#
# Actions:
#  Install dpkg
#
# Depends:
#  gen_puppet
#
class gen_base::dpkg {
  package { "dpkg":
    ensure => latest;
  }
}

# Class: gen_base::ec2-api-tools
#
# Actions:
#  Install ec2-api-tools
#
# Depends:
#  gen_puppet
#
class gen_base::ec2-api-tools {
  package { "ec2-api-tools":
    ensure => latest;
  }
}

# Class: gen_base::echoping
#
# Actions:
#  Install echoping
#
# Depends:
#  gen_puppet
#
class gen_base::echoping {
  package { "echoping":
    ensure => latest;
  }
}

# Class: gen_base::elinks
#
# Actions:
#  Install elinks
#
# Depends:
#  gen_puppet
#
class gen_base::elinks {
  include gen_base::libgnutls26
  package { "elinks":
    ensure => latest;
  }
}

# Class: gen_base::facter
#
# Actions:
#  Install facter
#
# Depends:
#  gen_puppet
#
class gen_base::facter {
  package { "facter":
    ensure => latest;
  }
}

# Class: gen_base::file
#
# Actions:
#  Install file
#
# Depends:
#  gen_puppet
#
class gen_base::file {
  package { "file":
    ensure => latest;
  }
}

# Class: gen_base::funkload
#
# Actions:
#  Install funkload
#
# Depends:
#  gen_puppet
#
class gen_base::funkload {
  # dependencies (missing in debian package)
  include gen_base::python-setuptools
  include gen_base::python-docutils
  include gen_base::tcpwatch-httpproxy
  package { "funkload":
    ensure => latest;
  }
}

# Class: gen_base::genisoimage
#
# Actions:
#  Install genisoimage
#
# Depends:
#  gen_puppet
#
class gen_base::genisoimage {
  package { "genisoimage":
    ensure => latest;
  }
}

# Class: gen_base::ia32-libs
#
# Actions:
#  Install ia32-libs
#
# Depends:
#  gen_puppet
#
class gen_base::ia32-libs {
  package { "ia32-libs":
    ensure => latest;
  }
}

# Class: gen_base::ifenslave-2_6
#
# Actions:
#  Install ifenslave-2_6
#
# Depends:
#  gen_puppet
#
class gen_base::ifenslave-2_6 {
  package { "ifenslave-2.6":
    ensure => latest;
  }
}

# Class: gen_base::imagemagick
#
# Actions:
#  Install imagemagick
#
# Depends:
#  gen_puppet
#
class gen_base::imagemagick {
  include gen_base::libtiff4
  include gen_base::libmagickwand3
  include gen_base::libmagickcore3

  package { "imagemagick":
    ensure => latest;
  }
}

# Class: gen_base::ipaddress_ruby
#
# Actions:
#  Install ipaddress-ruby
#
# Depends:
#  gen_puppet
#
class gen_base::ipaddress_ruby {
  package { "ipaddress-ruby":
    ensure => latest;
  }
}

# Class: gen_base::javascript-common
#
# Actions:
#  Install javascript-common
#
# Depends:
#  gen_puppet
#
class gen_base::javascript-common {
  package { "javascript-common":
    ensure => latest;
  }
}

# Class: gen_base::jmxquery
#
# Actions:
#  Install jmxquery
#
# Depends:
#  gen_puppet
#
class gen_base::jmxquery {
  package { "jmxquery":
    ensure => latest;
  }
}

# Class: gen_base::libcurl3
#
# Actions:
#  Install libcurl3
#
# Depends:
#  gen_puppet
#
class gen_base::libcurl3 {
  package { "libcurl3":
    ensure => latest;
  }
}

# Class: gen_base::libcurl3_gnutls
#
# Actions:
#  Install libcurl3-gnutls
#
# Depends:
#  gen_puppet
#
class gen_base::libcurl3_gnutls {
  package { "libcurl3-gnutls":
    ensure => latest;
  }
}

# Class: gen_base::libgnutls26
#
# Actions:
#  Install libgnutls26
#
# Depends:
#  gen_puppet
#
class gen_base::libgnutls26 {
  include gen_base::libtasn1_3

  package { "libgnutls26":
    ensure => latest;
  }
}

# Class: gen_base::libgssapi-krb5-2
#
# Actions:
#  Install libgssapi-krb5-2
#
# Depends:
#  gen_puppet
#
class gen_base::libgssapi-krb5-2 {
  package { "libgssapi-krb5-2":
    ensure => latest;
  }
}

# Class: gen_base::libisccc60
#
# Actions:
#  Install libisccc60
#
# Depends:
#  gen_puppet
#
class gen_base::libisccc60 {
  package { "libisccc60":
    ensure => latest;
  }
}

# Class: gen_base::libisccc80
#
# Actions:
#  Install libisccc80
#
# Depends:
#  gen_puppet
#
class gen_base::libisccc80 {
  package { "libisccc80":
    ensure => latest;
  }
}

# Class: gen_base::libmagickcore3
#
# Actions:
#  Install libmagickcore3
#
# Depends:
#  gen_puppet
#
class gen_base::libmagickcore3 {
  package { "libmagickcore3":
    ensure => latest;
  }
}

# Class: gen_base::libmagickwand3
#
# Actions:
#  Install libmagickwand3
#
# Depends:
#  gen_puppet
#
class gen_base::libmagickwand3 {
  package { "libmagickwand3":
    ensure => latest;
  }
}

# Class: gen_base::libjs_jquery
#
# Actions:
#  Install libjs-jquery
#
# Depends:
#  gen_puppet
#
class gen_base::libjs_jquery {
  package { "libjs-jquery":
    ensure => latest;
  }
}

# Class: gen_base::libk5crypto3
#
# Actions:
#  Install libk5crypto3
#
# Depends:
#  gen_puppet
#
class gen_base::libk5crypto3 {
  package { "libk5crypto3":
    ensure => latest;
  }
}

# Class: gen_base::libkrb5-3
#
# Actions:
#  Install libkrb5-3
#
# Depends:
#  gen_puppet
#
class gen_base::libkrb5-3 {
  package { "libkrb5-3":
    ensure => latest;
  }
}

# Class: gen_base::libkrb5support0
#
# Actions:
#  Install libkrb5support0
#
# Depends:
#  gen_puppet
#
class gen_base::libkrb5support0 {
  package { "libkrb5support0":
    ensure => latest;
  }
}

# Class: gen_base::libactiverecord_ruby18
#
# Actions:
#  Install libactiverecord-ruby1.8
#
# Depends:
#  gen_puppet
#
class gen_base::libactiverecord_ruby18 {
  package { "libactiverecord-ruby1.8":
    ensure => latest;
  }
}

# Class: gen_base::libalgorithm_diff_perl
#
# Actions:
#  Install libalgorithm-diff-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libalgorithm_diff_perl {
  package { "libalgorithm-diff-perl":
    ensure => latest;
  }
}

# Class: gen_base::libapache2-mod-auth-mysql
#
# Actions:
#  Install libapache2-mod-auth-mysql
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-auth-mysql {
  package { "libapache2-mod-auth-mysql":
    ensure => latest,
    notify => Exec["reload-apache2"];
  }
}

# Class: gen_base::libapache2-mod-fastcgi
#
# Actions:
#  Install libapache2-mod-fastcgi
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-fastcgi {
  package { "libapache2-mod-fastcgi":
    ensure => latest,
    notify => Exec["reload-apache2"];
  }
}

# Class: gen_base::libapache2-mod-fcgid
#
# Actions:
#  Install libapache2-mod-fcgid
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-fcgid {
  package { "libapache2-mod-fcgid":
    ensure => latest,
    notify => Exec["reload-apache2"];
  }
}

# Class: gen_base::libapache2-mod-passenger
#
# Actions:
#  Install libapache2-mod-passenger
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-passenger {
  package { "libapache2-mod-passenger":
    ensure => latest;
  }
}

# Class: gen_base::libapache2_mod_php5
#
# Actions:
#  Install libapache2-mod-php5
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2_mod_php5 {
  package { "libapache2-mod-php5":
    ensure => latest;
  }
}

# Class: gen_base::libapache2-mod-perl2
#
# Actions:
#  Install libapache2-mod-perl2
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-perl2 {
  package { "libapache2-mod-perl2":
    ensure => latest;
  }
}

# Class: gen_base::libapache2-mod-wsgi
#
# Actions:
#  Install libapache2-mod-wsgi
#
# Depends:
#  gen_puppet
#
class gen_base::libapache2-mod-wsgi {
  package { "libapache2-mod-wsgi":
    ensure => latest;
  }
}

# Class: gen_base::libapr1
#
# Actions:
#  Install libapr1
#
# Depends:
#  gen_puppet
#
class gen_base::libapr1 {
  package { "libapr1":
    ensure => latest;
  }
}

# Class: gen_base::libcgi_session_perl
#
# Actions:
#  Install libcgi-session-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libcgi_session_perl {
  package { "libcgi-session-perl":
    ensure => latest;
  }
}

# Class: gen_base::libcommons-logging-java
#
# Actions:
#  Install libcommons-logging-java
#
# Depends:
#  gen_puppet
#
class gen_base::libcommons-logging-java {
  package { "libcommons-logging-java":
    ensure => latest;
  }
}

# Class: gen_base::libcups2
#
# Actions:
#  Install libcups2
#
# Depends:
#  gen_puppet
#
class gen_base::libcups2 {
  package { "libcups2":
    ensure => latest;
  }
}

# Class: gen_base::libcupsimage2
#
# Actions:
#  Install libcupsimage2
#
# Depends:
#  gen_puppet
#
class gen_base::libcupsimage2 {
  package { "libcupsimage2":
    ensure => latest;
  }
}

# Class: gen_base::libdate-calc-perl
#
# Actions:
#  Install libdate-calc-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libdate-calc-perl {
  package { "libdate-calc-perl":
    ensure => latest;
  }
}

# Class: gen_base::libdate-manip-perl
#
# Actions:
#  Install libdate-manip-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libdate-manip-perl {
  package { "libdate-manip-perl":
    ensure => latest;
  }
}

# Class: gen_base::libdbi-perl
#
# Actions:
#  Install libdbi-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libdbi-perl {
  package { "libdbi-perl":
    ensure => latest;
  }
}

# Class: gen_base::libdigest_sha1_perl
#
# Actions:
#  Install libdigest-sha1-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libdigest_sha1_perl {
  package { "libdigest-sha1-perl":
    ensure => latest;
  }
}

# Class: gen_base::liberror_perl
#
# Actions:
#  Install liberror-perl
#
# Depends:
#  gen_puppet
#
class gen_base::liberror_perl {
  package { "liberror-perl":
    ensure => latest;
  }
}

# Class: gen_base::libfreetype6
#
# Actions:
#  Install libfreetype6
#
# Depends:
#  gen_puppet
#
class gen_base::libfreetype6 {
  package { "libfreetype6":
    ensure => latest;
  }
}

# Class: gen_base::libhtml_parser_perl
#
# Actions:
#  Install libhtml-parser-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libhtml_parser_perl {
  package { "libhtml-parser-perl":
    ensure => latest;
  }
}

# Class: gen_base::libio-socket-inet6-perl
#
# Actions:
#  Install libio-socket-inet6-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libio-socket-inet6-perl {
  package { "libio-socket-inet6-perl":
    ensure => latest;
  }
}

# Class: gen_base::liblocale_maketext_lexicon_perl
#
# Actions:
#  Install liblocale-maketext-lexicon-perl
#
# Depends:
#  gen_puppet
#
class gen_base::liblocale_maketext_lexicon_perl {
  package { "liblocale-maketext-lexicon-perl":
    ensure => latest;
  }
}

# Class: gen_base::libmozjs2d
#
# Actions:
#  Install libmozjs2d
#
# Depends:
#  gen_puppet
#
class gen_base::libmozjs2d {
  package { "libmozjs2d":
    ensure => latest;
  }
}

# Class: gen_base::libmysql-ruby
#
# Actions:
#  Install libmysql-ruby
#
# Depends:
#  gen_puppet
#
class gen_base::libmysql-ruby {
  package { "libmysql-ruby":
    ensure => latest;
  }
}

# Class: gen_base::libmysqlclient
#
# Actions:
#  Install libmysqlclient16
#
# Depends:
#  gen_puppet
#
class gen_base::libmysqlclient {
  if $lsbdistcodename == 'wheezy' {
    package { "libmysqlclient18":
      ensure => latest;
    }
  } else {
    package { "libmysqlclient16":
      ensure => latest;
    }
  }
}

# Class: gen_base::libnet_dns_perl
#
# Actions:
#  Install libnet-dns-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libnet_dns_perl {
  package { "libnet-dns-perl":
    ensure => latest;
  }
}

# Class: gen_base::libnet-ip-perl
#
# Actions:
#  Install libnet-ip-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libnet-ip-perl {
  package { "libnet-ip-perl":
    ensure => latest;
  }
}

# Class: gen_base::libnet-ping-external-perl
#
# Actions:
#  Install libnet-ping-external-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libnet-ping-external-perl {
  package { "libnet-ping-external-perl":
    ensure => latest;
  }
}

# Class: gen_base::liblog4j1_2-java
#
# Actions:
#  Install liblog4j1.2-java
#
# Depends:
#  gen_puppet
#
class gen_base::liblog4j1_2-java {
  package { "liblog4j1.2-java":
    ensure => latest;
  }
}

# Class: gen_base::libmailtools-perl
#
# Actions:
#  Install libmailtools-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libmailtools-perl {
  package { "libmailtools-perl":
    ensure => latest;
  }
}

# Class: gen_base::libpam-modules
#
# Actions:
#  Install libpam-modules
#
# Depends:
#  gen_puppet
#
class gen_base::libpam-modules {
  package { "libpam-modules":
    ensure => latest;
  }
}

# Class: gen_base::libpam-runtime
#
# Actions:
#  Install libpam-runtime
#
# Depends:
#  gen_puppet
#
class gen_base::libpam-runtime {
  package { "libpam-runtime":
    ensure => latest;
  }
}

# Class: gen_base::libpam0g
#
# Actions:
#  Install libpam0g
#
# Depends:
#  gen_puppet
#
class gen_base::libpam0g {
  package { "libpam0g":
    ensure => latest;
  }
}

# Class: gen_base::libparallel-forkmanager-perl
#
# Actions:
#  Install libparallel-forkmanager-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libparallel-forkmanager-perl {
  package { "libparallel-forkmanager-perl":
    ensure => latest;
  }
}

# Class: gen_base::libpng12_0
#
# Actions:
#  Install libpng12-0
#
# Depends:
#  gen_puppet
#
class gen_base::libpng12_0 {
  package { "libpng12-0":
    ensure => latest;
  }
}

# Class: gen_base::libpq5
#
# Actions:
#  Install libpq5
#
# Depends:
#  gen_puppet
#
class gen_base::libpq5 {
  package { "libpq5":
    ensure => latest;
  }
}

# Class: gen_base::libreadline5-dev
#
# Actions:
#  Install libreadline5-dev
#
# Depends:
#  gen_puppet
#
class gen_base::libreadline5-dev {
  package { "libreadline5-dev":
    ensure => latest;
  }
}

# Class: gen_base::libsnmp-perl
#
# Actions:
#  Install libsnmp-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libsnmp-perl {
  package { "libsnmp-perl":
    ensure => latest;
  }
}

# Class: gen_base::libsocket6-perl
#
# Actions:
#  Install libsocket6-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libsocket6-perl {
  package { "libsocket6-perl":
    ensure => latest;
  }
}

# Class: gen_base::libspreadsheet-parseexcel-perl
#
# Actions:
#  Install libspreadsheet-parseexcel-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libspreadsheet-parseexcel-perl {
  package { "libspreadsheet-parseexcel-perl":
    ensure => latest;
  }
}

# Class: gen_base::libssl-dev
#
# Actions:
#  Install libssl-dev
#
# Depends:
#  gen_puppet
#
class gen_base::libssl-dev {
  package { "libssl-dev":
    ensure => latest;
  }
}

# Class: gen_base::libstdcplusplus5
#
# Actions:
#  Install libstdc++5
#
# Depends:
#  gen_puppet
#
class gen_base::libstdcplusplus5 {
  package { "libstdc++5":
    ensure => latest;
  }
}

# Class: gen_base::libstomp_ruby
#
# Actions:
#  Install libstomp-ruby
#
# Depends:
#  gen_puppet
#
class gen_base::libstomp_ruby {
  package { "libstomp-ruby":
    ensure => latest;
  }
}

# Class: gen_base::libt1-5
#
# Actions:
#  Install libt1-5
#
# Depends:
#  gen_puppet
#
class gen_base::libt1-5 {
  package { "libt1-5":
    ensure => latest;
  }
}

# Class: gen_base::libtasn1_3
#
# Actions:
#  Install libtasn1-3
#
# Depends:
#  gen_puppet
#
class gen_base::libtasn1_3 {
  package { "libtasn1-3":
    ensure => latest;
  }
}

# Class: gen_base::libtiff4
#
# Actions:
#  Install libtiff4
#
# Depends:
#  gen_puppet
#
class gen_base::libtiff4 {
  package { "libtiff4":
    ensure => latest;
  }
}

# Class: gen_base::libtime-modules-perl
#
# Actions:
#  Install libtime-modules-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libtime-modules-perl {
  package { "libtime-modules-perl":
    ensure => latest;
  }
}

# Class: gen_base::liburi_perl
#
# Actions:
#  Install liburi-perl
#
# Depends:
#  gen_puppet
#
class gen_base::liburi_perl {
  package { "liburi-perl":
    ensure => latest;
  }
}

# Class: gen_base::libwww-perl
#
# Actions:
#  Install libwww-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libwww-perl {
  package { "libwww-perl":
    ensure => latest;
  }
}

# Class: gen_base::libxenstore3_0
#
# Actions:
#  Install libxenstore3.0
#
# Depends:
#  gen_puppet
#
class gen_base::libxenstore3_0 {
  package { "libxenstore3.0":
    ensure => latest;
  }
}

# Class: gen_base::libxml_simple_perl
#
# Actions:
#  Install libxml-simple-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libxml_simple_perl {
  package { "libxml-simple-perl":
    ensure => latest;
  }
}

# Class: gen_base::libxml_xpath_perl
#
# Actions:
#  Install libxml-xpath-perl
#
# Depends:
#  gen_puppet
#
class gen_base::libxml_xpath_perl {
  package { "libxml-xpath-perl":
    ensure => latest;
  }
}

# Class: gen_base::libxml2
#
# Actions:
#  Install libxml2
#
# Depends:
#  gen_puppet
#
class gen_base::libxml2 {
  package { "libxml2":
    ensure => latest;
  }
}

# Class: gen_base::libxml2_utils
#
# Actions:
#  Install libxml2-utils
#
# Depends:
#  gen_puppet
#
class gen_base::libxml2_utils {
  package { "libxml2-utils":
    ensure => latest;
  }
}

# Class: gen_base::linux-base
#
# Actions:
#  Install linux-base
#
# Depends:
#  gen_puppet
#
class gen_base::linux-base {
  package { "linux-base":
    ensure => latest;
  }
}

# Class: gen_base::linux-image
#
# Actions:
#  Make sure the latest image is installed
#
# Parameters:
#  version
#    The version we need to install the latest package of.
#
# Depends:
#  gen_puppet
#
class gen_base::linux-image ($version) {
  package { "linux-image-${version}":
    ensure => latest;
  }

  # Also install the normal lenny kernel if we're not running the backports kernel already
  if ($lsbdistcodename == "lenny") and ($kernelrelease != "2.6.26-2-amd64") {
    package { "linux-image-2.6.26-2-amd64":
      ensure => latest;
    }
  }
}

# Class: gen_base::mailgraph
#
# Actions:
#  Install mailgraph
#
# Depends:
#  gen_puppet
#
class gen_base::mailgraph {
  package { "mailgraph":
    ensure => latest;
  }
}

# Class: gen_base::mc
#
# Actions:
#  Install mc
#
# Depends:
#  gen_puppet
#
class gen_base::mc {
  package { "mc":
    ensure => latest;
  }
}

# Class: gen_base::memcached
#
# Actions:
#  Install memcached
#
# Depends:
#  gen_puppet
#
class gen_base::memcached {
  package { "memcached":
    ensure => latest;
  }
}

# Class: gen_base::module_init_tools
#
# Actions:
#  Install module-init-tools
#
# Depends:
#  gen_puppet
#
class gen_base::module_init_tools {
  package { "module-init-tools":
    ensure => latest;
  }
}

# Class: gen_base::mozjs2d
#
# Actions:
#  Install mozjs2d
#
# Depends:
#  gen_puppet
#
class gen_base::mozjs2d {
  package { "mozjs2d":
    ensure => latest;
  }
}

# Class: gen_base::mysql_client
#
# Actions:
#  Install mysql-client
#
# Depends:
#  gen_puppet
#
class gen_base::mysql_client {
  package { "mysql-client":
    ensure => latest;
  }
}

# Class: gen_base::mysql_common
#
# Actions:
#  Install mysql-common
#
# Depends:
#  gen_puppet
#
class gen_base::mysql_common {
  if versioncmp($lsbdistrelease, "6") >= 0 {
    include gen_base::libmysqlclient
  }

  package { "mysql-common":
    ensure => latest;
  }
}

# Class: gen_base::munin-libvirt-plugins
#
# Actions:
#  Install munin-libvirt-plugins
#
# Depends:
#  gen_puppet
#
class gen_base::munin-libvirt-plugins {
  include gen_base::python-libvirt
  package { "munin-libvirt-plugins":
    ensure => latest;
  }
}

# Class: gen_base::nagios-nrpe-plugin
#
# Actions:
#  Install nagios-nrpe-plugin
#
# Depends:
#  gen_puppet
#
class gen_base::nagios-nrpe-plugin {
  package { "nagios-nrpe-plugin":
    ensure => latest;
  }
}

# Class: gen_base::nagios-plugins-standard
#
# Actions:
#  Install nagios-plugins-standard
#
# Depends:
#  gen_puppet
#
class gen_base::nagios-plugins-standard {
  include gen_base::libxml2
  include gen_base::libpq5
  include gen_base::mysql_common

  package { "nagios-plugins-standard":
    ensure => latest;
  }
}

# Class: gen_base::nano
#
# Actions:
#  Install nano
#
# Depends:
#  gen_puppet
#
class gen_base::nano {
  package { "nano":
    ensure => latest;
  }
}

# Class: gen_base::netpbm
#
# Actions:
#  Install netpbm
#
# Depends:
#  gen_puppet
#
class gen_base::netpbm {
  package { "netpbm":
    ensure => latest;
  }
}

# Class: gen_base::nscd
#
# Actions:
#  Install nscd
#
# Depends:
#  gen_puppet
#
class gen_base::nscd {
  package { "nscd":
    ensure => latest;
  }
}

# Class: gen_base::openoffice_org_baise
#
# Actions:
#  Install openoffice.org-base
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_base {
  package { "openoffice.org-base":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_calc
#
# Actions:
#  Install openoffice.org-calc
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_calc {
  package { "openoffice.org-calc":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_emailmerge
#
# Actions:
#  Install openoffice.org-emailmerge
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_emailmerge {
  package { "openoffice.org-emailmerge":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_filter_binfilter
#
# Actions:
#  Install openoffice.org-filter-binfilter
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_filter_binfilter {
  package { "openoffice.org-filter-binfilter":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_filter_mobiledev
#
# Actions:
#  Install openoffice.org-filter_mobiledev
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_filter_mobiledev {
  package { "openoffice.org-filter-mobiledev":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_impress
#
# Actions:
#  Install openoffice.org-impress
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_impress {
  package { "openoffice.org-impress":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_math
#
# Actions:
#  Install openoffice.org-math
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_math {
  package { "openoffice.org-math":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_officebean
#
# Actions:
#  Install openoffice.org-officebean
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_officebean {
  package { "openoffice.org-officebean":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_report_builder_bin
#
# Actions:
#  Install openoffice.org-report-builder-bin
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_report_builder_bin {
  package { "openoffice.org-report-builder-bin":
    ensure => installed;
  }
}

# Class: gen_base::openoffice_org_writer
#
# Actions:
#  Install openoffice.org-writer
#
# Depends:
#  gen_puppet
#
class gen_base::openoffice_org_writer {
  package { "openoffice.org-writer":
    ensure => installed;
  }
}

# Class: gen_base::openjdk-6-jre
#
# Actions:
#  Install openjdk-6-jre
#
# Depends:
#  gen_puppet
#
class gen_base::openjdk-6-jre {
  package { "openjdk-6-jre":
    ensure => installed;
  }
}

# Class: gen_base::perl
#
# Actions:
#  Install perl
#
# Depends:
#  gen_puppet
#
class gen_base::perl {
  package { "perl":
    ensure => latest;
  }
}

# Class: gen_base::php5_gd
#
# Actions:
#  Install php5-gd
#
# Depends:
#  gen_puppet
#
class gen_base::php5_gd {
  include gen_base::libpng12_0

  package { "php5-gd":
    ensure => latest;
  }
}

# Class: gen_base::php5_imagick
#
# Actions:
#  Install php5-imagick
#
# Depends:
#  gen_puppet
#
class gen_base::php5_imagick {
  include gen_base::imagemagick

  package { "php5-imagick":
    ensure => latest;
  }
}

# Class: gen_base::php5_ldap
#
# Actions:
#  Install php5-ldap
#
# Depends:
#  gen_puppet
#
class gen_base::php5_ldap {
  package { "php5-ldap":
    ensure => latest;
  }
}

# Class: gen_base::php5_mcrypt
#
# Actions:
#  Install php5-mcrypt
#
# Depends:
#  gen_puppet
#
class gen_base::php5_mcrypt {
  package { "php5-mcrypt":
    ensure => latest;
  }
}

# Class: gen_base::php5_mysql
#
# Actions:
#  Install php5-mysql
#
# Depends:
#  gen_puppet
#
class gen_base::php5_mysql {
  package { "php5-mysql":
    ensure => latest;
  }
}

# Class: gen_base::php5_recode
#
# Actions:
#  Install php5-recode
#
# Depends:
#  gen_puppet
#
class gen_base::php5_recode {
  package { "php5-recode":
    ensure => latest;
  }
}

# Class: gen_base::php5_sqlite
#
# Actions:
#  Install php5-sqlite
#
# Depends:
#  gen_puppet
#
class gen_base::php5_sqlite {
  package { "php5-sqlite":
    ensure => latest;
  }
}

# Class: gen_base::php5_xdebug
#
# Actions:
#  Install php5-xdebug
#
# Depends:
#  gen_puppet
#
class gen_base::php5_xdebug {
  package { "php5-xdebug":
    ensure => latest;
  }
}

# Class: gen_base::php_pear
#
# Actions:
#  Install php-pear
#
# Depends:
#  gen_puppet
#
class gen_base::php_pear {
  package { "php-pear":
    ensure => latest;
  }
}

# Class: gen_base::poppler_utils
#
# Actions:
#  Install poppler-utils
#
# Depends:
#  gen_puppet
#
class gen_base::poppler_utils {
  package { "poppler-utils":
    ensure => latest;
  }
}

# Class: gen_base::postfix_mysql
#
# Actions:
#  Install postfix-mysql
#
# Depends:
#  gen_puppet
#
class gen_base::postfix_mysql {
  package { 'postfix-mysql':
    ensure => latest;
  }
}

# Class: gen_base::pstotext
#
# Actions:
#  Install pstotext
#
# Depends:
#  gen_puppet
#
class gen_base::pstotext {
  package { "pstotext":
    ensure => latest;
  }
}

# Class: gen_base::python-argparse
#
# Actions:
#  Install python-argparse
#
# Depends:
#  gen_puppet
#
class gen_base::python-argparse {
  package { "python-argparse":
    ensure => latest;
  }
}

# Class: gen_base::python_dev
#
# Actions:
#  Install python-dev
#
# Depends:
#  gen_puppet
#
class gen_base::python_dev {
  package { "python-dev":
    ensure => latest;
  }
}

# Class: gen_base::python_django_south
#
# Actions:
#  Install python-django-south
#
# Depends:
#  gen_puppet
#
class gen_base::python_django_south {
  package { "python-django-south":
    ensure => latest;
  }
}

# Class: gen_base::python-dnspython
#
# Actions:
#  Install python-dnspython
#
# Depends:
#  gen_puppet
#
class gen_base::python-dnspython {
  package { "python-dnspython":
    ensure => latest;
  }
}

# Class: gen_base::python-docutils
#
# Actions:
#  Install python-docutils
#
# Depends:
#  gen_puppet
#
class gen_base::python-docutils {
  package { "python-docutils":
    ensure => latest;
  }
}

# Class: gen_base::python_imaging
#
# Actions:
#  Install python-imaging
#
# Depends:
#  gen_puppet
#
class gen_base::python_imaging {
  package { "python-imaging":
    ensure => latest;
  }
}

# Class: gen_base::python-ipaddr
#
# Actions:
#  Install python-ipaddr
#
# Depends:
#  gen_puppet
#
class gen_base::python-ipaddr {
  package { "python-ipaddr":
    ensure => latest;
  }
}

# Class: gen_base::python-libvirt
#
# Actions:
#  Install python-libvirt
#
# Depends:
#  gen_puppet
#
class gen_base::python-libvirt {
  include gen_base::libxenstore3_0
  include gen_base::python_libxml2
  package { "python-libvirt":
    ensure => latest;
  }
}

# Class: gen_base::python_libxml2
#
# Actions:
#  Install python-libxml2
#
# Depends:
#  gen_puppet
#
class gen_base::python_libxml2 {
  include gen_base::libxml2
  package { "python-libxml2":
    ensure => latest;
  }
}

# Class: gen_base::python_lxml
#
# Actions:
#  Install python-lxml
#
# Depends:
#  gen_puppet
#
class gen_base::python_lxml {
  package { "python-lxml":
    ensure => latest;
  }
}

# Class: gen_base::python-mysqldb
#
# Actions:
#  Install python-mysqldb
#
# Depends:
#  gen_puppet
#
class gen_base::python-mysqldb {
  package { "python-mysqldb":
    ensure => latest;
  }
}

# Class: gen_base::python_psycopg2
#
# Actions:
#  Install python-psycopg2
#
# Depends:
#  gen_puppet
#
class gen_base::python_psycopg2 {
  package { "python-psycopg2":
    ensure => latest;
  }
}

# Class: gen_base::python_pycurl
#
# Actions:
#  Install python-pycurl
#
# Depends:
#  gen_puppet
#
class gen_base::python_pycurl {
  include gen_base::libcurl3_gnutls
  package { "python-pycurl":
    ensure => latest;
  }
}

# Class: gen_base::python_pypdf
#
# Actions:
#  Install python-pypdf
#
# Depends:
#  gen_puppet
#
class gen_base::python_pypdf {
  package { "python-pypdf":
    ensure => latest;
  }
}

# Class: gen_base::python_reportlab
#
# Actions:
#  Install python-reportlab
#
# Depends:
#  gen_puppet
#
class gen_base::python_reportlab {
  package { "python-reportlab":
    ensure => latest;
  }
}

# Class: gen_base::python-setuptools
#
# Actions:
#  Install python-setuptools
#
# Depends:
#  gen_puppet
#
class gen_base::python-setuptools {
  package { "python-setuptools":
    ensure => latest;
  }
}

# Class: gen_base::python_virtualenv
#
# Actions:
#  Install python-virtualenv
#
# Depends:
#  gen_puppet
#
class gen_base::python_virtualenv {
  package { "python-virtualenv":
    ensure => latest;
  }
}

# Class: gen_base::pyzor
#
# Actions:
#  Install pyzor
#
# Depends:
#  gen_puppet
#
class gen_base::pyzor {
  package { 'pyzor':
    ensure => latest;
  }
}

# Class: gen_base::qemu_utils
#
# Actions:
#  Install qemu-utils
#
# Depends:
#  gen_puppet
#
class gen_base::qemu_utils {
  package { "qemu-utils":
    ensure => latest;
  }
}

# Class: gen_base::razor
#
# Actions:
#  Install razor
#
# Depends:
#  gen_puppet
#
class gen_base::razor {
  package { 'razor':
    ensure => latest;
  }
}

# Class: gen_base::rails
#
# Actions:
#  Install rails
#
# Depends:
#  gen_puppet
#
class gen_base::rails {
  package { "rails":
    ensure => latest;
  }
}

# Class: gen_base::realpath
#
# Actions:
#  Install realpath
#
# Depends:
#  gen_puppet
#
class gen_base::realpath {
  package { "realpath":
    ensure => latest;
  }
}

# Class: gen_base::reprepro
#
# Actions:
#  Install reprepro
#
# Depends:
#  gen_puppet
#
class gen_base::reprepro {
  package { "reprepro":
    ensure => latest;
  }
}

# Class: gen_base::rsync
#
# Actions:
#  Install rsync
#
# Depends:
#  gen_puppet
#
class gen_base::rsync {
  package { "rsync":
    ensure => latest;
  }
}

# Class: gen_base::ruby_stomp
#
# Actions:
#  Install ruby-stomp 1.1.9 from the Kumina repository
#
# Depends:
#  gen_puppet
#
class gen_base::ruby_stomp {
  package { "ruby-stomp":
    ensure => latest;
  }
}

# Class: gen_base::sharutils
#
# Actions:
#  Install sharutils
#
# Depends:
#  gen_puppet
#
class gen_base::sharutils {
  package { "sharutils":
    ensure => latest;
  }
}

# Class: gen_base::smbclient
#
# Actions:
#  Install smbclient
#
# Depends:
#  gen_puppet
#
class gen_base::smbclient {
  package { "smbclient":
    ensure => latest;
  }
}

# Class: gen_base::subversion
#
# Actions:
#  Install subversion
#
# Depends:
#  gen_puppet
#
class gen_base::subversion {
  package { "subversion":
    ensure => latest;
  }
}

# Class: gen_base::sysstat
#
# Actions:
#  Install sysstat
#
# Depends:
#  gen_puppet
#
class gen_base::sysstat {
  package { "sysstat":
    ensure => latest;
  }
}

# Class: gen_base::tcpwatch-httpproxy
#
# Actions:
#  Install tcpwatch-httpproxy
#
# Depends:
#  gen_puppet
#
class gen_base::tcpwatch-httpproxy {
  package { "tcpwatch-httpproxy":
    ensure => latest;
  }
}

# Class: gen_base::telnet_ssl
#
# Actions:
#  Install telnet-ssl
#
# Depends:
#  gen_puppet
#
class gen_base::telnet_ssl {
  package { "telnet-ssl":
    ensure => latest;
  }
}

# Class: gen_base::telnet_ssl
#
# Actions:
#  Install ttf-mscorefonts-installer
#
# Depends:
#  gen_puppet
#
class gen_base::ttf_mscorefonts_installer {
  package { 'ttf-mscorefonts-installer':
    ensure => latest;
  }
}

# Class: gen_base::ucarp
#
# Actions:
#  Install ucarp
#
# Depends:
#  gen_puppet
#
class gen_base::ucarp {
  package { "ucarp":
    ensure => latest;
  }
}

# Class: gen_base::unoconv
#
# Actions:
#  Install unoconv
#
# Depends:
#  gen_puppet
#
class gen_base::unoconv {
  package { "unoconv":
    ensure => latest;
  }
}

# Class: gen_base::unzip
#
# Actions:
#  Install unzip
#
# Depends:
#  gen_puppet
#
class gen_base::unzip {
  package { "unzip":
    ensure => latest;
  }
}

# Class: gen_base::vim
#
# Actions:
#  Install vim
#
# Depends:
#  gen_puppet
#
class gen_base::vim {
  package { "vim":
    ensure => latest;
  }
}

# Class: gen_base::vim-addon-manager
#
# Actions:
#  Install vim-addon-manager
#
# Depends:
#  gen_puppet
#
class gen_base::vim-addon-manager {
  package { "vim-addon-manager":
    ensure => latest;
  }
}

# Class: gen_base::vlan
#
# Actions:
#  Install vlan
#
# Depends:
#  gen_puppet
#
class gen_base::vlan {
  package { "vlan":
    ensure => latest;
  }
}

# Class: gen_base::wget
#
# Actions:
#  Install wget
#
# Depends:
#  gen_puppet
#
class gen_base::wget {
  package { "wget":
    ensure => latest;
  }
}

# Class: gen_base::wondershaper
#
# Actions:
#  Install wondershaper
#
# Depends:
#  gen_puppet
#
class gen_base::wondershaper {
  package { "wondershaper":
    ensure => latest;
  }
}

# Class: gen_base::xvfb
#
# Actions:
#  Install xvfb
#
# Depends:
#  gen_puppet
#
class gen_base::xvfb {
  package { "xvfb":
    ensure => latest;
  }
}

# Class: gen_base::zip
#
# Actions:
#  Install zip
#
# Depends:
#  gen_puppet
#
class gen_base::zip {
  package { "zip":
    ensure => latest;
  }
}

# Class: gen_base::zoo
#
# Actions:
#  Install zoo
#
# Depends:
#  gen_puppet
#
class gen_base::zoo {
  package { "zoo":
    ensure => latest;
  }
}
