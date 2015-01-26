#
# Cookbook Name:: df_box_rails
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update" do 
	ignore_failure true 
end
include_recipe "df_rails::default"
include_recipe "df_nginx::default"
include_recipe "df_php::default"

execute "rails new public" do 
	cwd "/home/app/mysite/current"
	not_if do ::File.exists?('/home/app/mysite/current/public/config/unicorn.rb') end
	action :run
end

template "/home/app/mysite/current/public/config/unicorn.rb" do 
	source "unicornrb.erb"
	action :create 
end

directory "/home/app/mysite/current/public/pids" do
	recursive true
	mode "0777" 
	action :create
end

file "/home/app/mysite/current/public/log/unicorn.log" do 
	mode "0777"
	action :create
end

execute "unicorn_rails -c config/unicorn.rb -D" do 
	cwd "/home/app/mysite/current/public" 
	action :run 
end
