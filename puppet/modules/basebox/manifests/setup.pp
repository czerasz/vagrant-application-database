class basebox::setup (
	$vm_name = "base"
) {
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