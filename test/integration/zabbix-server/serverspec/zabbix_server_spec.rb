require 'spec_helper'

describe user('zabbix') do
  it { should exist }
  it { should belong_to_group 'zabbix' }
end

%w(zabbix-release zabbix-server-pgsql zabbix-web-pgsql zabbix-web zabbix-web-japanese zabbix zabbix-get).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/etc/zabbix/zabbix_server.conf') do
  it { should be_file }
end

describe service('zabbix-server') do
  it { should be_enabled }
  it { should be_running }
end

describe port(10051) do
  it { should be_listening }
end
