class database::setup () {
	mysql::db { "test":
	  user     => "test",
	  password => "test",
	  host     => "localhost",
	  grant    => ['all'],
	}	
}