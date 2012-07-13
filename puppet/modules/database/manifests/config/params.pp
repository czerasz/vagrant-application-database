class database::config::params {
	$packages = $operatingsystem ? {
     /(?i)ubuntu|debian/        => ['mysql-client', 'mysql-server'],
  }
	# $packages = ["mysql-client", "mysql-server", "libmysqlclient-dev"]
}