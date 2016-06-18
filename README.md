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

## Applying

### Vagrant Test
This module was built and tested using a puppet Vagrant box. To reproduce the development environment, launch puppetlabs/ubuntu-14.04-64-puppet with Vagrant.

You will need to add the following line to the sudoers file. Note the tab between `Defaults` and `exempt`.

```Defaults       exempt_group=vagrant```

You can run sudo `puppet agent -V` to test if the sudoers modification applied correctly. Then run the following commands to install the module from git with dependencies. The last line will run the smoke test manifest to apply the module. The website will then be hosted at `<FQDN or IP>:8000`

 
```
sudo wget https://github.com/willonit/sdp_nginx/archive/master.tar.gz
sudo mkdir -p /etc/puppetlabs/code/environments/production/modules/
sudo tar -xf master.tar.gz -C /etc/puppetlabs/code/environments/production/modules/
sudo mv /etc/puppetlabs/code/environments/production/modules/sdp* /etc/puppetlabs/code/environments/production/modules/sdp_nginx
rm -Rf master*
sudo puppet module install jfryman-nginx
sudo puppet module install puppetlabs-vcsrepo
sudo puppet apply /etc/puppetlabs/code/environments/production/modules/sdp_nginx/examples/init.pp
```

### PE Classification
The module can also be used with Puppet Enterprise. Install the module into the correct code directory on the PE Master along with dependencies. The node can be classified in the PE Console by adding the `sdp_nginx` class to a group. You may also apply the configuration by adding `include sdp_nginx` to your site.pp or another manifest. 



