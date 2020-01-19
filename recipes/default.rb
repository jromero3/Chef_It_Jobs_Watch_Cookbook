#
# Cookbook:: It_Jobs_Watch_Cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update' do
  action :update
end

package 'python3-pip'

remote_directory '/home/ubuntu/app' do
  source 'app'
  action :create
end

execute 'requirements.txt' do
  cwd '/home/ubuntu'
  command 'pip3 install -r app/requirements.txt'
end

directory 'Downloads' do
  path '/home/vagrant/Downloads'
  action :create
end

file 'ItJobsWatchTop30.csv' do
  path '/home/vagrant/Downloads/ItJobsWatchTop30.csv'
  action :create
end
