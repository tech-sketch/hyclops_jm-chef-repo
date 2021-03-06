# common settings
default[:zabbix][:version] = "2.2"
if node[:zabbix][:version] == "2.4"
  default[:zabbix][:rpm_url] = 'http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm'
elsif node[:zabbix][:version] == "2.2"
  default[:zabbix][:rpm_url] = 'http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm'
elsif node[:zabbix][:version] == "2.0"
  default[:zabbix][:rpm_url] = 'http://repo.zabbix.com/zabbix/2.0/rhel/6/x86_64/zabbix-release-2.0-1.el6.noarch.rpm'
else
  default[:zabbix][:rpm_url] = 'http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm'
end

# zabbix server settings
default[:zabbix][:server][:host_url] = '127.0.0.1'
default[:zabbix][:server][:port] = '10051'
default[:zabbix][:server][:packages] = ['zabbix-server-pgsql', 'zabbix-web-pgsql', 'zabbix-web-japanese', 'zabbix-get', 'zabbix-sender']
default[:zabbix][:server][:allow_root] = false
default[:zabbix][:server][:db_host_url] = '127.0.0.1'
default[:zabbix][:server][:db_port] = 5432
default[:zabbix][:server][:db_type] = 'POSTGRESQL'
default[:zabbix][:server][:db_name] = 'zabbix'
default[:zabbix][:server][:db_user] = 'zabbix'
default[:zabbix][:server][:db_pass] = 'zabbix'
