#
# Cookbook Name:: grafana
# Recipe:: _nginx
#
# Copyright (C) 2015 SoftDirect Ltd
# Copyright (C) 2015 Pavel Bakhmetev
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

template '/etc/nginx/sites-available/grafana' do
  source node['grafana']['nginx']['template']
  cookbook node['grafana']['nginx']['template_cookbook']
  notifies :reload, 'service[nginx]'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    server_name: node['grafana']['webserver_hostname'],
    server_aliases: node['grafana']['webserver_aliases'],
    grafana_dir: node['grafana']['web_dir'],
    listen_address: node['grafana']['webserver_listen'],
    listen_port: node['grafana']['webserver_port'],
  )
end

nginx_site 'grafana' do
  template false
end
