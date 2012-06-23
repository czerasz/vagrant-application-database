class boxes::application () {
	class { "boxes::base":
		vm_name => "application",
	}

	include webserver
}