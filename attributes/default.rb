default['grafana']['file']['type'] = 'tar.gz' # tar.gz | zip
default['grafana']['file']['version'] = '1.9.1'
default['grafana']['file']['url'] = 'http://grafanarel.s3.amazonaws.com/grafana-%{version}.%{type}'
default['grafana']['file']['checksum'] = 'c328c7a002622f672affbcaabd5e64ae279be1051ee27c62ba22bfed63680508' # sha256 ( shasum -a 256 FILENAME )
default['grafana']['install_path'] = '/opt'
default['grafana']['install_dir'] = "#{node['grafana']['install_path']}/grafana"
default['grafana']['admin_password'] = ''
default['grafana']['web_dir'] = node['grafana']['install_dir']

# webserver
default['grafana']['user'] = 'nginx'
default['grafana']['config_template'] = 'config.js.erb'
default['grafana']['config_cookbook'] = 'grafana'
default['grafana']['webserver_hostname'] = node.name
default['grafana']['webserver_aliases'] = ['0.0.0.0']
default['grafana']['webserver_listen'] = '0.0.0.0'
default['grafana']['webserver_port'] = 80
default['grafana']['webserver_scheme'] = 'http://'

# config.js
default['grafana']['default_route'] = '/dashboard/file/default.json'
default['grafana']['timezone_offset'] = 'null' # Example: "-0500" (for UTC - 5 hours)
default['grafana']['grafana_index'] = 'grafana-index'
default['grafana']['unsaved_changes_warning'] = 'true'
default['grafana']['playlist_timespan'] = '1m'
default['grafana']['window_title_prefix'] = 'Grafana - '
default['grafana']['search_max_results'] = 20
