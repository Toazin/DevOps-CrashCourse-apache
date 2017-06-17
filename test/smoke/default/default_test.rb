# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe file('/var/www/html/index.html') do
 it { should be_file }
end

describe file('/var/www/html/index.html') do
 it { should be_owned_by 'root' }
end

describe command('curl localhost') do
   its('stdout') { should eq '<h1> Hello, world_ </h1>' }
end
