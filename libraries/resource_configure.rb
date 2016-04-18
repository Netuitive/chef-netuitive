class NetuitiveCookbook::NetuitiveConfigureResource < Chef::Resource::LWRPBase
  resource_name :netuitive_configure
  provides :netuitive_configure

  actions :create
  default_action :create

  attribute(:api_key, kind_of: String, default: 'CHANGE_ME_PLZ')
  attribute(:api_url, kind_of: String, default: 'https://api.app.netuitive.com/ingest/infrastructure')
  attribute(:statsd_enabled, kind_of: String, default: 'False')
  attribute(:conf_path, kind_of: String, default: '/opt/netuitive-agent/conf/netuitive-agent.conf')
  attribute(:cookbook_template, kind_of: String, default: 'netuitive')
  # DONT USE THIS UNTIL config merging is fixed in netuitive/diamond
  attribute(:custom_config_path, kind_of: String, default: '/opt/netuitive-agent/conf/custom_config.conf')
  attribute(:custom_vars, kind_of: Hash, default: nil)
  # an array of relations
  attribute(:relations, kind_of: Array, default: [])
  attribute(:source, kind_of: String, default: 'netuitive-agent.conf.erb')
  # the array needs to be a list of strings with 'tagName:tagVal'
  attribute(:tags, kind_of: Array, default: [])
  # this will attempt an auto discover and choose init system
  # in the following order: systemd, upstart, init.d
  # see helpers module for more info
  attribute(:init_scripts, kind_of: Hash, default: nil)
end
