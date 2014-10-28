#
# Cookbook Name:: fabric
# Recipe:: install
#
# Copyright 2014, TIS inc.
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when 'centos', 'redhat', 'amazon'
  execute 'Install basic packages for fabric' do
    command 'yum -y groupinstall "Development Tools" "Base"'
    user 'root'
    action :run
  end

  %w(zlib-devel tk-devel tcl-devel sqlite-devel
    ncurses-devel gdbm-devel readline-devel bzip2-devel db4-devel openssl-devel
    python-setuptools python-devel).each do |pkg|
    yum_package pkg
  end
end

include_recipe "python::pip"

# First install paramiko is always error.so ignore.
python_pip 'pycrypto' do
  action :install
  ignore_failure true
end

python_pip 'setuptools' do
  action :upgrade
end


%w(paramiko fabric).each do |pkg|
  python_pip pkg do
    action :install
  end
end
