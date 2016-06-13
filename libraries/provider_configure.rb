class NetuitiveCookbook::NetuitiveConfigureProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_configure if defined?(provides)

  use_inline_resources if defined?(use_inline_resources)

  action :create do
    # your netutive config with the default plugins
    # see custom_collectors to add additional collectors
    template new_resource.conf_path do
      source new_resource.source
      cookbook new_resource.cookbook_template
      variables(
        api_key: new_resource.api_key,
        api_url: new_resource.api_url,
        statsd_enabled: new_resource.statsd_enabled,
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
