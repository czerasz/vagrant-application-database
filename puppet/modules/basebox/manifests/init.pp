class basebox (
	$vm_name = "base"
) {
	include basebox::prepare

	stage { "update": }
	class { "basebox::setup":
		vm_name => $vm_name,
		stage => "update"
	}

	Class["basebox::prepare"] -> Class["basebox::setup"]

	Class["basebox::prepare"] -> notify { "after update": }
}