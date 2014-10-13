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
