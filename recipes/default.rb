#
# Cookbook Name:: df_box_rails
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "df_rails::default"
include_recipe "df_nginx::default"
include_recipe "df_php::default"
