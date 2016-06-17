# Class: sdp_nginx
# ===========================
# The sdp_nginx class deploys a websever and website matching the requirements
# for the Service Delivery Partner Technical Challenge. 
#
# Parameters
# ----------
# All parameters are set in the params.pp file. There are no user defined 
# parameters required or availible when applying the class.
#
# Examples
# --------
# @example
#    class { 'sdp_nginx': }
#    or
#    include sdp_nginx

class sdp_nginx inherits sdp_nginx::params {
  
  $siteroot = $sdp_nginx::params::siteroot
  $port = $sdp_nginx::params::port

  include nginx

  nginx::resource::vhost { $module_name:
    listen_port => $port,
    www_root    => "${siteroot}${module_name}",
  }

  package{ 'git' :
    ensure => present,
  }

  vcsrepo{ "${siteroot}${module_name}" :
    ensure   => present,
    provider => git,
    source   => 'https://github.com/puppetlabs/exercise-webpage',
    require  => Package['git'],
  }

}
