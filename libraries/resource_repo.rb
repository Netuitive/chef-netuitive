#
# Cookbook: netuitive
# license: All rights reserved
#

# Chef Resource for setting up a netuitive_repo
class NetuitiveCookbook::NetuitiveRepoResource < Chef::Resource::LWRPBase
  resource_name :netuitive_repo
  provides :netuitive_repo

  actions :add
  default_action :add

  # these use `attributes/default.rb` for default values per platform for repo_url, repo_keys, repo_components, and repo_pins
  attribute(:repo_components, kind_of: Hash, default: nil)
  attribute(:repo_keys, kind_of: Hash, default: nil)
  attribute(:repo_priority_pins, kind_of: Hash, default: nil)
  attribute(:repo_urls, kind_of: Hash, default: nil)

  # whether or not to enable epel repos on epel based systems
  attribute(:use_epl_repos, kind_of: [TrueClass, FalseClass], default: true)

  # if this version parameter is not set by the caller, we look at
  # `attributes/default.rb` for a default value to use, or we raise
  attribute(:version, kind_of: String, default: nil)
end
