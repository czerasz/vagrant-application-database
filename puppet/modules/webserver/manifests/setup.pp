# Initialize projects 
class webserver::setup () {
	# Define all Your nginx projects below
	# example:
	#
	#   webserver::project{ "project_name":
	# 	  configuration_template => "config_template"
	#   }
	#
	# The configuration_template attribute defines the nginx configuration file for the project
	# which should be stored in puppet/modules/webserver/templates/etc/nginx/sites-available/

	include nginx

	webserver::project{ "test": }

	Class["nginx"] -> Project["test"] ~> Class["nginx::service"]
}