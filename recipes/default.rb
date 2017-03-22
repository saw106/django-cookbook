#
# Cookbook Name:: django_fun
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'django_fun::installs'
include_recipe 'django_fun::djangopython'
include_recipe 'django_fun::server_parts'
include_recipe 'django_fun::uwsgi'