class database () {
	stage { "database":
		require => Stage["update"]
	}

	class { "database::install":
		stage => "database"
	}

	include database::setup

	Class["database::install"] -> Class["database::setup"]
}