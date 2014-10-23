require 'spec_helper'

pg_ver = '9.3'
pg_pkg_ver = pg_ver.split('.').join
pg_service = "postgresql-#{pg_ver}"
pg_data = "/var/lib/pgsql/#{pg_ver}/data"

describe file("/etc/yum.repos.d/pgdg-#{pg_pkg_ver}-centos.repo") do
  it { should be_file }
end

%W(postgresql#{pg_pkg_ver}-devel postgresql#{pg_pkg_ver}-server).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

%W(#{pg_data}/postgresql.conf #{pg_data}/pg_hba.conf).each do |file|
  describe file(file) do
    it { should be_file }
  end
end

describe service(pg_service) do
  it { should be_enabled }
  it { should be_running }
end
