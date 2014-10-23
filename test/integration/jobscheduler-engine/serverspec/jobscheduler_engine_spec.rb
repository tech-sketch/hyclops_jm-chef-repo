require 'spec_helper'

describe user('scheduler') do
  it { should exist }
  it { should have_home_directory '/home/scheduler' }
  it { should have_login_shell '/bin/bash' }
end

describe file('/etc/sudoers.d/jobscheduler') do
  it { should be_file }
  it { should contain 'scheduler' }
end

describe file('/opt/sos-berlin.com/jobscheduler') do
  it { should be_directory }
end

describe file('/home/scheduler/sos-berlin.com/jobscheduler') do
  it { should be_directory }
end

describe process('scheduler') do
  it { should be_running }
end

describe port(4444) do
  it { should be_listening }
end
