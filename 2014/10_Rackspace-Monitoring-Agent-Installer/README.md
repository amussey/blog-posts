# Rackspace Monitoring Agent Installer

Based on the instructions from [the Rackspace Knowledge Center article on installing the monitoring agent](http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent), this script will configure and activate the monitoring agent.

You will need:

 - Your username.
 - Your API key.  You can find this on the [MyCloud "Account Settings" page](https://mycloud.rackspace.com/account#settings).
 - `curl` installed on your server.

To run this script, run the following command from your server:

    sudo bash -c "$(curl -s https://raw.githubusercontent.com/amussey/blog-posts/master/2014/10_Rackspace-Monitoring-Agent-Installer/install.sh)"

This script requires root permissions to run successfully.  **PLEASE [view the contents](https://github.com/amussey/blog-posts/blob/master/2014/10_Rackspace-Monitoring-Agent-Installer/install.sh) of the script before blindly curling and running it!**

## Support

This script currently supports and has been tested with the following server flavors:

 - Ubuntu 14.04 (Standard & PVHVM)
 - Ubuntu 12.04 (Standard & PVHVM)
 - Ubuntu 10.04
 - Debian 7
 - Debian 6
 - Fedora 20
 - Fedora 19
 - Red Hat Enterprise 7
 - Red Hat Enterprise 6
 - Red Hat Enterprise 5
 - CentOS 7
 - CentOS 6
 - CentOS 5

The script additionally supports the following server flavors, though they have not been tested:

 - Ubuntu 13.10
 - Ubuntu 13.04
 - Ubuntu 12.10
 - Ubuntu 11.10
 - Ubuntu 11.04
 - Fedora 17
 - Fedora 16
