#!/bin/bash

# command -v lsb_release >/dev/null 2>&1 || { echo "This script requires lsb_release, but the command is not available." >&2; exit 1; }

# echo -e "This script will need to be run as root.  To view the source of this script, visit:\n"


YOUR_INSTALL=$(head -1 /etc/issue | sed 's/ \\n \\l//')


if [ "$YOUR_INSTALL" = "Ubuntu 10.04" ] ; then
    echo "Ubuntu 10.04"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-10.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 11.04" ] ; then
    echo "Ubuntu 11.04"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 11.10" ] ; then
    echo "Ubuntu 11.10"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 12.04" ] ; then
    echo "Ubuntu 12.04"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 12.10" ] ; then
    echo "Ubuntu 12.10"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 13.04" ] ; then
    echo "Ubuntu 13.04"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 13.10" ] ; then
    echo "Ubuntu 13.10"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Ubuntu 14.04" ] ; then
    echo "Ubuntu 14.04"
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-14.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
elif [ "$YOUR_INSTALL" = "Debian GNU/Linux 6.0" ] ; then
    echo "Debian 6.0"
elif [ "$YOUR_INSTALL" = "Debian GNU/Linux 7" ] ; then
    echo "Debian 7.0"
elif [[ "$YOUR_INSTALL" =~ "Debian GNU/Linux jessie" ]] ; then
    echo "Debian Jessie"
    echo "Unfortunately, your operating system is not yet supported by the Rackspace Monitoring Agent."
    exit 1
elif [[ "$YOUR_INSTALL" =~ "Fedora release 19" ]] ; then
    echo "Fedora 19"
elif [[ "$YOUR_INSTALL" =~ "Fedora release 20" ]] ; then
    echo "Fedora 20"
elif [[ "$YOUR_INSTALL" =~ "Red Hat Enterprise Linux Server release 5" ]] ; then
    echo "Fedora 19"
elif [[ "$YOUR_INSTALL" =~ "CentOS release 6.5" ]] ; then
    echo "CentOS 6.5"
fi
