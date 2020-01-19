# InSpec test for recipe It_Jobs_Watch_Cookbook::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe package 'python3-pip' do
  it { should be_installed }
end

describe file('/home/vagrant/Downloads') do
  it { should be_directory }
end

describe file('/home/vagrant/Downloads/ItJobsWatchTop30.csv') do
  it { should be_a_file }
end
