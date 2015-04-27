# razordemo
This module builds a fully functioning Razor demo.  It requires two additional
things to work seemlessly, both of which will be a part of a future seteam stack.

1) Update /etc/puppetlabs/puppet/autosign.conf with this line:
host*.vm

2) Build a VM which will PXE boot to the vboxnet0 network.  This can be done
manually or you can pull down the box I built on atlas with:
vagrant init chrismatteson/iPXE.

Additionally, this VM, already configured for the vboxnet0 network will be
included in but commented out of a future stack, and will require editing of
config/vms.yaml to activate.  A vagrant up on that VM will also cause it to
launch graphically.


In order to use this module, simple classify a linux VM with the class razordemo.
Currently the module requires two puppet runs on the system to complete due to
the need for Razor to build bootstrap.ipxe after it's installed. 

As configured, this module will install centos6.6 onto any system where
is_virtual = true that boots from it.  Additional rules an be added to hiera and
will be collected with a hiera_hash.  You can also manage the razor system using the
razor gem.  Unfortunately do to a change in razor's ports, you either need to specify
-u https://localhost:8151 with every command, or run:
gem install pe-razor-client --source http://rubygems.delivery.puppetlabs.net/
Note that is our internal gem repositiory and will require you being on the VPN to
access.

Please let me know if you have questions or issues.  Thanks.
- Chris Matteson 4/27/15
