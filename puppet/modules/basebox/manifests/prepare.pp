class basebox::prepare () {
	if ($operatingsystem == "Ubuntu") {
	    notify {"You are on that is why we need to update first": }
  }

	Exec {
	  path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
	}

	# update the apt package manager when being on ubuntu
	if ( $operatingsystem == "Ubuntu" ) {
		# Update only the first time when the 
		exec { 'mkdir -p /tmp/puppet/ && ( echo $(date +%s) >> /tmp/puppet/apt-update-first ) && apt-get update': 
		  command     => 'apt-get update',
		  creates => "/tmp/puppet/apt-update-first",
		}

		class { "apt": }
	}
}