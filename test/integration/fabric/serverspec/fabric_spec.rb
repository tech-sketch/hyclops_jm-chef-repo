require 'spec_helper'

describe command('fab -V') do
  its(:stdout) { should match /Fabric/ }
end
