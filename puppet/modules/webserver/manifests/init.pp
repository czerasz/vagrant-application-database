class webserver () {
	stage { "webserver":
		require => Stage["update"],
	}

	class { "webserver::setup":
		stage => "webserver",
	}
}