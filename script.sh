#!/bin/bash

#Check CentOS verision

version=$(grep '^VERSION_ID' /etc/os-release)
#echo $version

if [[ $version = 'VERSION_ID="8"' ]] ;
then
  echo -e "Your are in CentOS 8"
elif [[ $version = 'VERSION_ID="7"' ]] ;
  then
    echo -e "You are in CentOS 7"
fi

#Install clamav antivirus

yum -y install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
echo -e "Clamav is installed"

#Install the EPEL repositories

echo -e "As your OS version is CentOS 7, the installation of EPEL will now begin."
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo -e "EPEL repository correctly installed"


#Update yum packages

update=$(yum check-update)
echo $updates

if [[ $update = "" ]];
then
  echo -e "There are not packages that need an update"
else
  yum -y update
fi
exit 0
