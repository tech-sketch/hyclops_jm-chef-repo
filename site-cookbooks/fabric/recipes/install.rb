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

easy_install_package 'pip' do
  action :upgrade
end

execute 'pip install setuptools --upgrade' do
  user 'root'
  action :run
end

%w(ecdsa fabric).each do |pkg|
  execute "pip install #{pkg}" do
    user 'root'
    action :run
  end
end