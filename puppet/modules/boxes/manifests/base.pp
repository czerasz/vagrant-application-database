class boxes::base ($vm_name="base") {

	Exec { path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"] }

	package { ["vim", "tree"]:
		ensure => present
	}

	file { "/etc/motd":
	  content => template("boxes/etc/motd.erb"),
	  ensure  => file,
	  replace => true,
	}
}