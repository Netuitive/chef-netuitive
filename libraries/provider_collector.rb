class NetuitiveCookbook::NetuitiveCollectorProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_collector if defined?(provides)

  use_inline_resources if defined?(use_inline_resources)

  action :create do
    unless new_resource.custom_collectors
      new_resource.custom_collectors determine_custom_collectors(new_resource, node)
    end
    unless new_resource.collectors_dir
      new_resource.collectors_dir determine_collectors_dir(new_resource, node)
    end

    # we expect a hash of collectors to gernerate a config for each
    new_resource.custom_collectors.each do |collector, options|
      Chef::Log.warn collector
      options.each do |k, v|
        Chef::Log.warn "#{k}=#{v}"
      end
      template "#{new_resource.collectors_dir}/#{collector}.conf" do
        source 'collector_generic.conf.erb'
        owner 'root'
        group 'root'
        cookbook new_resource.cookbook_template
        mode 00744
        variables(
          options: options
        )
        notifies :restart, 'service[netuitive-agent]', :delayed
      end
    end

    service 'netuitive-agent' do
      subscribes :restart, new_resource.conf_path.to_s
    end
  end
end
