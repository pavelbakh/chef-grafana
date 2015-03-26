#
# Cookbook Name:: grafana
# Recipe:: default
#
# Copyright (C) 2015 SoftDirect Ltd
# Copyright (C) 2015 Pavel Bakhmetev
#
# All rights reserved - Do Not Redistribute
#


include_recipe "grafana::_nginx"

directory node['grafana']['install_dir'] do
  owner node['grafana']['user']
  mode '0755'
  recursive true
end

include_recipe 'ark::default'
ark 'grafana' do
  url node['grafana']['file']['url'] % {
    version: node['grafana']['file']['version'],
    type: node['grafana']['file']['type']
  }
  path node['grafana']['install_path']
  checksum node['grafana']['file']['checksum']
  owner node['grafana']['user']
  strip_components(node['grafana']['file']['version'] > '1.5.1' ? 1 : 0)
  action :put
end


template "#{node['grafana']['web_dir']}/config.js" do
  source node['grafana']['config_template']
  cookbook node['grafana']['config_cookbook']
  variables 'datasources' => node['grafana']['datasources']
  mode '0644'
  user node['grafana']['user']
end
