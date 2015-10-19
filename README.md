# razordemo
## Synopsis
### Current version: 3.1.1

This module builds a fully functioning Razor demo infrastructure, including 
pe_razor, gems for razor API wrapper tools, dnsmasq (TFTP, DHCP, DNS), a broker, 
and initial razor tags (virtual, small, medium, large).  Implementation of 
specific razor repos and policies are done outside of this module and with profiles 
within the TSE Demo environment: currently, ```profile::razor::(cento67|esxi6|win2k12r2)```.  
It's best to classify your razor node with one of these profiles and NOT this module directly.

DCHP process for the vboxnet0 network needs to be stopped: 
```
vboxmanage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0)
```
You can either do this manually, or run scripts/razor_up.sh in the Vagrant environment 
directory which will do it for you.

Running the aforementioned script will also boot up an empty VM image we have in 
Vagrant cloud (puppetlabs-tse/razorbase).  At a default, this will match the 
tag "virtual" which will match every Razor policy we have a profile for.  If you 
classify your Razor node with multiple profiles, it will match the latest policy
created.  You can control this either by using different tags or disabling some policies
using 'razor disable-policy --name policy_name'.

## Installation

Do not classify with this module directly, instead classify with a profile mentioned above. 
The profiles require this module.

Additional notes:
The Razor microkernel (Centos 7) username and password are:
root/thincrust

Please let me know if you have questions or issues.  Thanks.


## Contributors
Chris Matteson - Original - 4/27/15 
Kai Pak - 2015.2 fixes - 09/06/15 

Credit: The types and providers under lib here are taken and slightly modified
from Lavaburn/razor. Enough changes have occured with Razor between PE version 
3.8.x and 2015.2 that master branch of this module will not work with 3.8.x 
and older.
