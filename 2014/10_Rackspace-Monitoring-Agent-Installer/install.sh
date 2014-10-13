#!/bin/bash -e

echo -e "Rackspace Monitoring Agent Installer\n"

if [ -e "/etc/issue" ] ; then
    YOUR_DISTRO=$(head -1 /etc/issue | sed 's/ \\n \\l//')
else
    echo -e "Unable to find /etc/issue to detect your OS distro and version.\nExiting."
    exit 1
fi

if [ "$EUID" -ne 0 ] ; then
    echo "In order to use your system's package manager, this script will need to be run as root."
    echo -e "To view the contents of this script, visit:\n\n    https://raw.githubusercontent.com/amussey/blog-posts/master/2014/10_Rackspace-Monitoring-Agent-Installer/install.sh\n\n"
    exit 3
fi

echo -e "This installer will require your MyCloud username and API key, found on the Account Settings page at:\n"
echo -e "    https://mycloud.rackspace.com/account#settings\n\n"

echo -n "Please enter your MyCloud username: "
read RAX_USERNAME
echo -n "Please enter your API Key: "
read RAX_APIKEY

echo -en "\nReady to install the monitoring agent.  Press [ENTER] to proceed."
read

if [[ "$YOUR_DISTRO" =~ "Ubuntu " ]] ; then
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; sudo apt-get update > /dev/null ; sudo apt-get install curl -y ; }
    if [[ "$YOUR_DISTRO" =~ "Ubuntu 10.04" ]] ; then
        echo "Ubuntu 10.04"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-10.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 11.04" ]] ; then
        echo "Ubuntu 11.04"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 11.10" ]] ; then
        echo "Ubuntu 11.10"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 12.04" ]] ; then
        echo "Ubuntu 12.04"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 12.10" ]] ; then
        echo "Ubuntu 12.10"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 13.04" ]] ; then
        echo "Ubuntu 13.04"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 13.10" ]] ; then
        echo "Ubuntu 13.10"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 14.04" ]] ; then
        echo "Ubuntu 14.04"
        sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-14.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    fi
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    sudo apt-get update > /dev/null
    sudo apt-get install rackspace-monitoring-agent -y
elif [ "$YOUR_DISTRO" = "Debian GNU/Linux 6.0" ] ; then
    echo "Debian 6 (Squeeze)"
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; sudo apt-get update > /dev/null ; sudo apt-get install curl -y ; }
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/debian-squeeze-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    sudo apt-get update > /dev/null
    sudo apt-get install rackspace-monitoring-agent -y
elif [ "$YOUR_DISTRO" = "Debian GNU/Linux 7" ] ; then
    echo "Debian 7 (Wheezy)"
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; sudo apt-get update > /dev/null ; sudo apt-get install curl -y ; }
    sudo sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/debian-wheezy-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    sudo apt-get update > /dev/null
    sudo apt-get install rackspace-monitoring-agent -y
elif [[ "$YOUR_DISTRO" =~ "Debian GNU/Linux jessie" ]] ; then
    echo "Debian Jessie"
    echo "Unfortunately, your operating system is not yet supported by the Rackspace Monitoring Agent."
    exit 1
elif [[ "$YOUR_DISTRO" =~ "Fedora release 19" ]] ; then
    echo "Fedora 19"
elif [[ "$YOUR_DISTRO" =~ "Fedora release 20" ]] ; then
    echo "Fedora 20"
elif [[ "$YOUR_DISTRO" =~ "Red Hat Enterprise Linux Server release 5" ]] ; then
    echo "Fedora 19"
elif [[ "$YOUR_DISTRO" =~ "CentOS release 6.5" ]] ; then
    echo "CentOS 6.5"
fi

sudo service rackspace-monitoring-agent stop
sudo rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
sudo service rackspace-monitoring-agent start

echo -e "\n\nMonitoring agent install complete!  The agent should now be running on your server.\n\nHappy monitoring!"

