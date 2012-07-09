class boxes::database () {
	class { "boxes::base":
		vm_name => "database",
	}

	notify { "description":
		message => hiera("user_name")
	}
}