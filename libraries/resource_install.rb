# frozen_string_literal: true

class NetuitiveCookbook::NetuitiveInstallResource < Chef::Resource::LWRPBase
  resource_name :netuitive_install
  provides :netuitive_install

  actions :install
  default_action :install

  # if this version parameter is not set by the caller, we look at
  # `attributes/default.rb` for a default value to use, or we raise
  attribute(:package_name, kind_of: String, default: 'netuitive-agent')
end
