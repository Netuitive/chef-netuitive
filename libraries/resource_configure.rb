# frozen_string_literal: true

class NetuitiveCookbook::NetuitiveConfigureResource < Chef::Resource::LWRPBase
  resource_name :netuitive_configure
  provides :netuitive_configure

  actions :create
  default_action :create

  attribute(:api_key, kind_of: String, default: 'CHANGE_ME_PLZ')
  attribute(:api_url, kind_of: String, default: 'https://api.app.netuitive.com/ingest/infrastructure')
  attribute(:conf_path, kind_of: String, default: '/opt/netuitive-agent/conf/netuitive-agent.conf')
  attribute(:cookbook_template, kind_of: String, default: 'netuitive')
  attribute(:disk_usage_collector_metrics_whitelist, kind_of: String, default: '(?:^.*\.io$|^.*\.average_queue_length$|^.*\.await$|^.*\.iops$|^.*\.read_await$|^.*\.reads$|^.*\.util_percentage|^.*\.write_await$|^.*\.writes$)')
  attribute(:docker_collector_enabled, kind_of: [TrueClass, FalseClass], default: false)

  # an array of relations
  attribute(:relations, kind_of: Array, default: [])
  attribute(:source, kind_of: String, default: 'netuitive-agent.conf.erb')

  # statsd attributes
  attribute(:statsd_enabled, kind_of: String, default: 'False')
  attribute(:statsd_forward, kind_of: [TrueClass, FalseClass], default: false)
  attribute(:statsd_forward_ip, kind_of: String, default: '127.0.0.1')
  attribute(:statsd_forward_port, kind_of: Integer, default: 9125)
  attribute(:statsd_listen_ip, kind_of: String, default: '127.0.0.1')
  attribute(:statsd_listen_port, kind_of: Integer, default: 8125)
  attribute(:statsd_prefix, kind_of: String, default: 'statsd')

  # the array needs to be a list of strings with 'tagName:tagVal'
  attribute(:tags, kind_of: Array, default: [])
end
