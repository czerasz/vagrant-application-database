class boxes::db () {
	class { "boxes::base":
		vm_name => "database",
	}

	include database
}