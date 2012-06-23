class boxes::base::update () {
	# if ($operatingsystem == "Ubuntu") and ($operatingsystemrelease == 10.04) {
	#     notify {"You are on Ubuntu 10.04, and that is why we need to update first": }

	# 		exec { "apt-get update":
	# 		  alias => "update_ubuntu_10_04",
	# 		  path => "/usr/bin",
	# 		  creates => "/etc/apt/sources.list.d/nginx-stable-natty.list",
	# 		}
	# 	}
 #  }
}

class boxes::base::init ($vm_name="base") {
	Exec { path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"] }

	package { ["vim", "tree", "screen", "curl"]:
		ensure => present
	}

	file { "/etc/motd":
	  content => template("boxes/etc/motd.erb"),
	  ensure  => file,
	  replace => true,
	}

	if ($operatingsystem == "Ubuntu") and ($operatingsystemrelease == 10.04) {
		exec { "fix locale bug": 
			command => "echo 'LC_ALL=\"en_GB.UTF-8\"' >> /etc/default/locale"
		}
	}
}

class boxes::base ($vm_name="base") {
	include boxes::base::update
	class { "boxes::base::init":
		vm_name => $vm_name,
	}

	Class["boxes::base::update"] -> Class["boxes::base::init"]
}