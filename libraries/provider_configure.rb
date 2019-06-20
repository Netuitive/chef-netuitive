# frozen_string_literal: true

class NetuitiveCookbook::NetuitiveConfigureProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_configure

  use_inline_resources

  action :create do
    # your netutive config with the default plugins
    # see custom_collectors to add additional collectors
    template new_resource.conf_path do
      source new_resource.source
      cookbook new_resource.cookbook_template
      variables(
        api_key: new_resource.api_key,
        api_url: new_resource.api_url,
        batch_size: new_resource.batch_size,
        disk_space_collector_exclude_filters: new_resource.disk_space_collector_exclude_filters,
        disk_usage_collector_metrics_whitelist: new_resource.disk_usage_collector_metrics_whitelist,
        docker_collector_enabled: new_resource.docker_collector_enabled,
        docker_collector_metrics_whitelist: new_resource.docker_collector_metrics_whitelist,
        statsd_enabled: new_resource.statsd_enabled,
        statsd_forward: new_resource.statsd_forward,
        statsd_forward_ip: new_resource.statsd_forward_ip,
        statsd_forward_port: new_resource.statsd_forward_port,
        statsd_listen_ip: new_resource.statsd_listen_ip,
        statsd_listen_port: new_resource.statsd_listen_port,
        statsd_prefix: new_resource.statsd_prefix,
        tags: new_resource.tags,
        relations: new_resource.relations
      )
      notifies :restart, 'service[netuitive-agent]'
    end

    service 'netuitive-agent' do
      subscribes :restart, new_resource.conf_path.to_s
    end
  end
end
