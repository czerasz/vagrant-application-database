class boxes::db () {
	class { "boxes::base":
		vm_name => "database",
	}

	class { "database": }

	# 	Class["boxes::base"] -> Class["database"]
}