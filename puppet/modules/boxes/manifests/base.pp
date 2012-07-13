class boxes::base (
	$vm_name = "base"
) {
	class { "basebox": 
		vm_name => "${vm_name}"
	}
}