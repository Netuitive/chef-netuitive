class NetuitiveCookbook::NetuitiveConfigureResource < Chef::Resource::LWRPBase
  resource_name :netuitive_configure
  provides :netuitive_configure

  actions :create
  default_action :create

  attribute(:api_key, kind_of: String, default: 'CHANGE_ME_PLZ')
  attribute(:api_url, kind_of: String, default: 'https://api.app.netuitive.com/ingest/infrastructure')
  attribute(:conf_path, kind_of: String, default: '/opt/netuitive-agent/conf/netuitive-agent.conf')
  attribute(:cookbook_template, kind_of: String, default: 'netuitive')
  # an array of relations
  attribute(:relations, kind_of: Array, default: [])
  attribute(:source, kind_of: String, default: 'netuitive-agent.conf.erb')
  attribute(:statsd_enabled, kind_of: String, default: 'False')
  # the array needs to be a list of strings with 'tagName:tagVal'
  attribute(:tags, kind_of: Array, default: [])
end
