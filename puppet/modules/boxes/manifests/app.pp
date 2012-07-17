class boxes::app () {
	class { "boxes::base":
		vm_name => "application",
	}

	class { "webserver": }

	Class["boxes::base"] -> Class["webserver"]
}