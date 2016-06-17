#sdp_nginx

##Description
This module is used to deploy the exercise webpage to the requirements below:
- server requests over port 8000
- serve a page with the contents of the https://github.com/puppetlabs/exercise­webpage repository

## Requirements
This solution was build and tested under Puppet 4.5.2 on Ubuntu 14.04 64-bit.
While not fully tested, this module should work on Puppet/Puppet Enterprise 4.5.2 or higher and support any OS supported by the dependent modules. 

### Dependencies
This module is dependent on two other modules:
- puppetlabs/vcsrepo
- jfryman/nginx

