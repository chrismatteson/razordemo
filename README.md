# razordemo

Credit: The types and providers under lib here are taken and slightly modified
from Lavaburn/razor.  I intend to wrap some case statements around the changes
from <3.8 to >3.8 in terms of ports and security, and commit those upstream
when I have time.

This module builds a fully functioning Razor demo.  It requires two additional
things to work seemlessly, both of which will be a part of a future seteam stack.

1) Disable DHCP for the vboxnet0 network on your VirtualBox setup.  I also had
to do a ps -A, find the virtualbox dhcp process and kill it manually for some
reason.  Apparently shutting down all VMs will avoid the need to kill it manually.

2) Update /etc/puppetlabs/puppet/autosign.conf with this line:
host*.vm (This is done in the seteam-vagrant-stack)

3) Build a VM which will PXE boot to the vboxnet0 network.  This can be done
manually or you can pull down the box I built on atlas with:
vagrant init chrismatteson/iPXE.

Additionally, this VM, already configured for the vboxnet0 is included in but
commented out of the seteam-vagrant-stack stack, and will require editing of
config/vms.yaml to activate.  A vagrant up on that VM will also cause it to
launch graphically.


In order to use this module, simple classify a centos 6 VM with the class razordemo.
Currently the module requires two puppet runs on the system to complete due to
the need for Razor to build bootstrap.ipxe after it's installed. 

When Razor is launching the first time, it will sit for several minutes apparently
doing nothing, and most like the only message on the screen will be a warning about
CPU compatibility.  Just wait.

As configured, this module will install centos6.6 onto any system where
is_virtual = true that boots from it.  Additional rules an be added to hiera and
will be collected with a hiera_hash.  You can also manage the razor system using the
razor gem.  Unfortunately do to a change in razor's ports, you either need to specify
-u https://localhost:8151 with every command, or run:
gem install pe-razor-client --source http://rubygems.delivery.puppetlabs.net/
Note that is our internal gem repositiory and will require you being on the VPN to
access.

Additional notes:
The Razor OS Image (Centos 7) username and password are:
root/thincrust

The centos6.6 image which this installs had the username and password of:
root/puppet

Please let me know if you have questions or issues.  Thanks.

- Chris Matteson 4/27/15
