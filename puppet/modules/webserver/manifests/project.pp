# This class is responsible for adding a project to a webserver
# It handles the vhost and copies the files to the right location

define webserver::project ( $configuration_template="default" ) {
	include stdlib

	# Projects name is defined by the title
	$project_name = $title

	$sites_available_path = "/etc/nginx/sites-available"
	$sites_enabled_path   = "/etc/nginx/sites-enabled"
	$project_path = "/home/vagrant/htdocs/${project_name}"

	# create the projects root directory
	file { ["/home/vagrant/htdocs", "/home/vagrant/htdocs/${project_name}"]:
	    ensure => "directory",
	    owner => "vagrant",
	    group => "vagrant",
	}

	# Create the index test file
	file { "${project_path}/index.html":
	    ensure => "file",
	    content => "<!DOCTYPE html>
	        <html><body>
	        Welcome to the projects ${project_name} main page.",
	    owner => "vagrant",
	    group => "vagrant",
	    mode => "0755",
	}

	# create the project in sites available
	$sites_available_directory_name = "${sites_available_path}/${project_name}"
	file { $sites_available_directory_name:
	    require => [
	        Package["nginx"],
	        File[$project_path],
	    ],
	    ensure => "file",
	    content => template("webserver/etc/nginx/sites-available/${configuration_template}"),
	}

	# create the project in sites enabled
	$sites_enabled_directory_name = "${sites_enabled_path}/${project_name}"
	file { $sites_enabled_directory_name:
	    require => File["${sites_available_path}/${project_name}"],
	    ensure => "link",
	    target => "${sites_available_path}/${project_name}",
	}

	# Create vhosts include list
	file{ "/etc/nginx/conf.d/vhost_list.conf":
		ensure => present,
		mode => "0644"
	}
	# Add project to the include list
  file_line { "add vhost":
	  path => "/etc/nginx/conf.d/vhost_list.conf",
	  line => "include ${sites_enabled_directory_name};",
	}

	File["/etc/nginx/conf.d/vhost_list.conf"] -> File_Line["add vhost"]
}