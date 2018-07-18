# frozen_string_literal: true

class NetuitiveCookbook::NetuitiveInstallProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_install

  use_inline_resources

  action :install do
    package new_resource.package_name
  end
end
