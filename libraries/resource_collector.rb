class NetuitiveCookbook::NetuitiveCollectorResource < Chef::Resource::LWRPBase
  resource_name :netuitive_collector
  provides :netuitive_collector

  actions :create
  default_action :create

  attribute(:conf_path, kind_of: String, default: '/opt/netuitive-agent/conf/netuitive-agent.conf')
  attribute(:collectors_dir, kind_of: String, default: '/opt/netuitive-agent/conf/collectors')
  attribute(:cookbook_template, kind_of: String, default: 'netuitive')
  attribute(:custom_collectors, kind_of: Hash)
  attribute(:source, kind_of: String, default: 'collector_generic.conf.erb')
end
