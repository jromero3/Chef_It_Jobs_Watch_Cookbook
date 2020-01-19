#
# Cookbook:: It_Jobs_Watch_Cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'It_Jobs_Watch_Cookbook::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should update all sources' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'Should install pip' do
      expect(chef_run).to install_package('python3-pip')
    end

    it 'Should install requirements via pip' do
      expect(chef_run).to run_execute('requirements.txt').with(
        cwd: '/home/ubuntu',
        command: 'pip3 install -r app/requirements.txt',
      )
    end

    it 'Should create a Downloads folder in /home/vagrant/Downloads' do
      expect(chef_run).to create_directory('/home/vagrant/Downloads')
    end

    it 'Should create a ItJobsWatchTop30.csv file in /home/vagrant/Downloads/ItJobsWatchTop30.csv' do
      expect(chef_run).to create_file('/home/vagrant/Downloads/ItJobsWatchTop30.csv')
    end
  end
end
