class NetuitiveCookbook::NetuitiveInstallProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_install if defined?(provides)

  use_inline_resources if defined?(use_inline_resources)

  action :install do
    package new_resource.package_name
  end
end
