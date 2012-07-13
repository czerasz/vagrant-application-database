class database::install() {
	class { "mysql": }

	class { "mysql::server":
	  config_hash => {
	  	root_password => "test"
	  }
	}
}