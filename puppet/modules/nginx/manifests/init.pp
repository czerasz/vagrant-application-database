# Class: nginx
#
# This module manages NGINX.
#
# Parameters:
# 
# There are no default parameters for this class. All module parameters are managed
# via the nginx::params class
#
# Actions:
#
# Requires:
#
#  Packaged NGINX
#    - RHEL: EPEL or custom package
#    - Debian/Ubuntu: Default Install or custom package
#    - SuSE: Default Install or custom package
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include nginx
# }
class nginx {
	include nginx::package
	include nginx::config
	include nginx::service
	
	Class['nginx::package'] -> Class['nginx::config'] ~> Class['nginx::service']
}
