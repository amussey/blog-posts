#!/bin/bash -e

echo -e "Rackspace Monitoring Agent Installer\n"

if [ -e "/etc/issue" ] ; then
    YOUR_DISTRO=$(head -1 /etc/issue | sed 's/ \\n \\l//')
    if [ -e "/etc/redhat-release" ] ; then
        YOUR_DISTRO=$(head -1 /etc/redhat-release)
    fi
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
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; apt-get update > /dev/null ; apt-get install curl -y ; }
    if [[ "$YOUR_DISTRO" =~ "Ubuntu 10.04" ]] ; then
        echo "Ubuntu 10.04"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-10.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 11.04" ]] ; then
        echo "Ubuntu 11.04"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 11.10" ]] ; then
        echo "Ubuntu 11.10"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-11.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 12.04" ]] ; then
        echo "Ubuntu 12.04"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 12.10" ]] ; then
        echo "Ubuntu 12.10"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-12.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 13.04" ]] ; then
        echo "Ubuntu 13.04"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 13.10" ]] ; then
        echo "Ubuntu 13.10"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-13.10-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    elif [[ "$YOUR_DISTRO" =~ "Ubuntu 14.04" ]] ; then
        echo "Ubuntu 14.04"
        sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/ubuntu-14.04-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    fi
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    apt-get update > /dev/null
    apt-get install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [ "$YOUR_DISTRO" = "Debian GNU/Linux 6.0" ] ; then
    echo "Debian 6 (Squeeze)"
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; apt-get update > /dev/null ; apt-get install curl -y ; }
    sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/debian-squeeze-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    apt-get update > /dev/null
    apt-get install rackspace-monitoring-agent -y

    /etc/init.d/rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /etc/init.d/rackspace-monitoring-agent start
elif [ "$YOUR_DISTRO" = "Debian GNU/Linux 7" ] ; then
    echo "Debian 7 (Wheezy)"
    command -v curl >/dev/null 2>&1 || { echo "Installing curl.  Performing apt-get update." ; apt-get update > /dev/null ; apt-get install curl -y ; }
    sh -c 'echo "deb http://stable.packages.cloudmonitoring.rackspace.com/debian-wheezy-x86_64 cloudmonitoring main" > /etc/apt/sources.list.d/rackspace-monitoring-agent.list'
    curl https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc | sudo apt-key add -
    echo "Performing apt-get update"
    apt-get update > /dev/null
    apt-get install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Debian GNU/Linux jessie" ]] ; then
    echo "Debian Jessie"
    echo "Unfortunately, your operating system is not yet supported by the Cloud Monitoring Agent."
    exit 1
elif [[ "$YOUR_DISTRO" =~ "Fedora release 16" ]] ; then
    echo "Fedora 16"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/fedora-16.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/fedora-16-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Fedora release 17" ]] ; then
    echo "Fedora 17"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/fedora-17.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/fedora-17-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Fedora release 19" ]] ; then
    echo "Fedora 19"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/fedora-19.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/fedora-19-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Fedora release 20" ]] ; then
    echo "Fedora 20"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/fedora-20.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/fedora-20-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Red Hat Enterprise " ]] && [[ "$YOUR_DISTRO" =~ " release 5" ]] ; then
    echo "Red Hat Enterprise 5"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/redhat-5.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/redhat-5-x86_64 " >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Red Hat Enterprise " ]] && [[ "$YOUR_DISTRO" =~ " release 6" ]] ; then
    echo "Red Hat Enterprise 6"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/redhat-6.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/redhat-6-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "Red Hat Enterprise " ]] && [[ "$YOUR_DISTRO" =~ " release 7" ]] ; then
    echo "Red Hat Enterprise 7"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/redhat-7.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/redhat-7-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "CentOS " ]] && [[ "$YOUR_DISTRO" =~ "release 5" ]] ; then
    echo "CentOS 5"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/centos-5.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/centos-5-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "CentOS " ]] && [[ "$YOUR_DISTRO" =~ "release 6" ]] ; then
    echo "CentOS 6"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/centos-6.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/centos-6-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
elif [[ "$YOUR_DISTRO" =~ "CentOS " ]] && [[ "$YOUR_DISTRO" =~ "release 7" ]] ; then
    echo "CentOS 7"
    curl https://monitoring.api.rackspacecloud.com/pki/agent/centos-7.asc > /tmp/signing-key.asc
    rpm --import /tmp/signing-key.asc
    echo "[rackspace]" > /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "name=Rackspace Monitoring" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "baseurl=http://stable.packages.cloudmonitoring.rackspace.com/centos-7-x86_64" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    echo "enabled=1" >> /etc/yum.repos.d/rackspace-cloud-monitoring.repo
    yum install rackspace-monitoring-agent -y

    /sbin/service rackspace-monitoring-agent stop
    rackspace-monitoring-agent --setup --username "$RAX_USERNAME" --apikey "$RAX_APIKEY" --production
    /sbin/service rackspace-monitoring-agent start
else
    echo "We were not able to detect your operating system."
    echo "Please visit http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent for manual install instructions."
    exit 4
fi


echo -e "\n\nMonitoring agent install complete!  The agent should now be running on your server.\n\nHappy monitoring!"
