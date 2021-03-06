#!/bin/sh

cd `dirname ${0}`
CHEF_DIR=$PWD

USER=scheduler
JM_HOME=/home/$USER/hyclops_jm
JS_DATA=/home/$USER/sos-berlin.com/jobscheduler/$USER

# Check 64bit cpu
if [ `uname -a | grep 64 | wc -l` -ne 1 ]; then
  echo "Please install HyClops JobMonitoring on 64bit cpu."
  exit 1
fi

# Check RHEL
if [ `cat /etc/redhat-release | wc -l` -ne 1 ]; then
  echo "Please install HyClops JobMonitoring on RHEL series OS."
  exit 1
fi

# Chef install
rpm -q chef 2>&1 > /dev/null
if [ `echo $?` -ne 0 ]; then
  curl -L https://www.opscode.com/chef/install.sh | bash
  if [ `echo $?` -ne 0 ]; then
    echo "Chef install error occured."
    exit 1
  fi
fi

cd $CHEF_DIR
if [ ! -e 'config/solo.rb' ]; then
  sed "s|CHEFDIR|$CHEF_DIR|g" config/solo.rb.example > config/solo.rb
fi

# Install fabric
if [ `fab -V 2>&1 | grep Fabric | wc -l` -eq 0 ]; then
  chef-solo -c config/solo.rb -o "role[fabric]" -j config/config.json
  if [ `echo $?` -ne 0 ]; then
    echo "Fabric install error occured."
    exit 1
  fi
fi

# Install PostgreSQL9.x
if [ `rpm -qa | grep postgresql9 | wc -l` -eq 0 ]; then
  chef-solo -c config/solo.rb -o "role[postgresql]" -j config/config.json
  if [ `echo $?` -ne 0 ]; then
    echo "PostgreSQL install error occured."
    exit 1
  fi
fi

# Install Zabbix
if [ `rpm -qa | grep zabbix-server | wc -l` -eq 0 ]; then
  chef-solo -c config/solo.rb -o "role[zabbix-server]" -j config/config.json
  if [ `echo $?` -ne 0 ]; then
    echo "Zabbix install error occured."
    exit 1
  fi
fi

# Install JobScheduler
test -e /opt/sos-berlin.com/jobscheduler/scheduler/bin/jobscheduler.sh
if [ `echo $?` -eq 1 ]; then
  chef-solo -c config/solo.rb -o "role[jobscheduler-engine]" -j config/config.json
  if [ `echo $?` -ne 0 ]; then
    echo "JobScheduler install error occured."
    exit 1
  fi
fi
