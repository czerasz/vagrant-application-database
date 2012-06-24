##About

This project is created to show the beauty and power of puppet.

##Requirements

This project is based on rvm and vagrant.<br />
Please use bundler which makes Your live easier.<br />
If You don't have vagrant already installed, I encourage You to install it as a gem although it's not the recommened approach.

##Installation

Enter the project directory and use `bundle install`, to install vagrant.

Then use `vagrant up application` to create the application VM.

##Known issues

There is an issue with the nginx module which I described [here](https://github.com/jfryman/puppet-nginx/issues/3).
This project uses the nginx puppet module as a git submodule. The git submodule is a [fork](https://github.com/czerasz/puppet-nginx/tree/iss3) of the orginal project which takes care of this issue.

##Used resources
* [nginx configuration](http://krisjordan.com/essays/goodbye-server-configuration-woes-hello-puppet)