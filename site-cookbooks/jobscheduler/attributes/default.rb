# common settings
default[:jobscheduler][:version][:major] = '1.7'
if node[:jobscheduler][:version][:major] == '1.7'
  default[:jobscheduler][:version][:minor] = '4274'
  default[:jobscheduler][:engine][:module_url] = "http://downloads.sourceforge.net/project/jobscheduler/Archive/JobScheduler%20since%201.7/jobscheduler_linux-x64.#{node[:jobscheduler][:version][:major]}.#{node[:jobscheduler][:version][:minor]}.tar.gz"
elsif node[:jobscheduler][:version][:major] == '1.6'
  default[:jobscheduler][:version][:minor] = '4246'
  default[:jobscheduler][:engine][:module_url] = "http://downloads.sourceforge.net/project/jobscheduler/Archive/JobScheduler%20since%201.6/jobscheduler_linux-x64.#{node[:jobscheduler][:version][:major]}.#{node[:jobscheduler][:version][:minor]}.tar.gz"
elsif node[:jobscheduler][:version][:major] == '1.5'
  default[:jobscheduler][:version][:minor] = '4014'
  default[:jobscheduler][:engine][:module_url] = "http://downloads.sourceforge.net/project/jobscheduler/Archive/JobScheduler%20since%201.5/jobscheduler_linux-x64.#{node[:jobscheduler][:version][:major]}.#{node[:jobscheduler][:version][:minor]}.tar.gz"
else
  default[:jobscheduler][:version][:major] = '1.7'
  default[:jobscheduler][:version][:minor] = '4274'
  default[:jobscheduler][:engine][:module_url] = "http://downloads.sourceforge.net/project/jobscheduler/Archive/JobScheduler%20since%201.7/jobscheduler_linux-x64.#{node[:jobscheduler][:version][:major]}.#{node[:jobscheduler][:version][:minor]}.tar.gz"
end
default[:jobscheduler][:user] = 'scheduler'
default[:jobscheduler][:user_home] = '/home'

# engine install settings
default[:jobscheduler][:engine][:scheduler_data] = "/opt/sos-berlin.com/jobscheduler"
default[:jobscheduler][:engine][:scheduler_home] = "/home/#{node[:jobscheduler][:user]}/sos-berlin.com/jobscheduler"
default[:jobscheduler][:engine][:host] = '127.0.0.1'
default[:jobscheduler][:engine][:port] = '4444'
default[:jobscheduler][:engine][:scheduler_id] = 'scheduler'
default[:jobscheduler][:engine][:allow_host] = '0.0.0.0'
default[:jobscheduler][:engine][:mail_server] = 'localhost'
default[:jobscheduler][:engine][:mail_port] = ''
default[:jobscheduler][:engine][:smtp_user] = ''
default[:jobscheduler][:engine][:smtp_password] = ''
default[:jobscheduler][:engine][:mail_from] = 'root@localhost'
default[:jobscheduler][:engine][:mail_to] = 'hyclops_jm@localhost'
default[:jobscheduler][:engine][:mail_cc] = ''
default[:jobscheduler][:engine][:mail_bcc] = ''
default[:jobscheduler][:engine][:job_event] = 'off'
default[:jobscheduler][:engine][:database][:type] = 'pgsql'
default[:jobscheduler][:engine][:database][:host] = '127.0.0.1'
default[:jobscheduler][:engine][:database][:port] = ''
default[:jobscheduler][:engine][:database][:root_user] = 'postgres'
default[:jobscheduler][:engine][:database][:root_password] = nil
default[:jobscheduler][:engine][:database][:schema] = 'scheduler'
default[:jobscheduler][:engine][:database][:user] = 'scheduler'
default[:jobscheduler][:engine][:database][:password] = 'scheduler'

# agent install settings
# TBD
# default[:jobscheduler][:agent][:module_url] = "#{node[:jobscheduler][:download_baseurl]}/JobScheduler.#{node[:jobscheduler][:version][:major]}/jobscheduler_linux-x64_agent.#{node[:jobscheduler][:version][:major]}.#{node[:jobscheduler][:version][:minor]}.tar.gz"
# default[:jobscheduler][:agent][:scheduler_data] = "/opt/sos-berlin.com/jobscheduler"
# default[:jobscheduler][:agent][:scheduler_home] = "/home/#{node[:jobscheduler][:user]}/sos-berlin.com/jobscheduler"
# default[:jobscheduler][:agent][:server_host] = '127.0.0.1'
# default[:jobscheduler][:agent][:port] = '4444'
# default[:jobscheduler][:agent][:scheduler_id] = 'scheduler_agent'
# default[:jobscheduler][:agent][:allow_host] = '0.0.0.0'
