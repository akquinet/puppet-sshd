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
class puppet_sshd ($port ='22'){
	package { "openssh-server":
		ensure => present,
	}
	file { "/etc/ssh/sshd_config":
		ensure => present,
		content => template('puppet_sshd/sshd_config.erb'),
		require => Package['openssh-server']
	}
}
