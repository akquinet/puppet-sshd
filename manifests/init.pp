# Class: puppet-sshd
#
# This module manages puppet-sshd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class sshd ($port ='22'){
        $pkg = $::operatingsystem ? {
          SLES => 'openssh',
          default => 'openssh-server' 
        }
  
        package { $pkg:
                ensure => present,
        }
        file { "/etc/ssh/sshd_config":
                ensure => present,
                content => template('sshd/sshd_config.erb'),
                require => Package[$pkg],
                notify => Service['sshd']
        }
        service { "sshd":
                ensure => running,
                hasrestart => true,
                hasstatus => true,
                enable => true,
                require => File["/etc/ssh/sshd_config"]
        }
}
