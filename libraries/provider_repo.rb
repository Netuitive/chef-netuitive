class NetuitiveCookbook::NetuitiveRepoProvider < Chef::Provider::LWRPBase
  include NetuitiveCookbook::Helpers
  provides :netuitive_repo

  use_inline_resources

  action :add do
    platform = determine_platform
    unless new_resource.version
      new_resource.version determine_version(new_resource, node)
    end
    unless new_resource.repo_urls
      new_resource.repo_urls determine_repo_urls(new_resource, node)
    end
    unless new_resource.repo_keys
      new_resource.repo_keys determine_repo_keys(new_resource, node)
    end
    unless new_resource.repo_components
      new_resource.repo_components determine_repo_components(new_resource, node)
    end
    unless new_resource.repo_priority_pins
      new_resource.repo_priority_pins determine_repo_priority_pins(new_resource, node)
    end

    case platform
    when 'debian'
      include_recipe 'apt'
      # add repo and key
      apt_repository 'netuitive' do
        distribution ''
        uri new_resource.repo_urls['debian']
        key new_resource.repo_keys['debian']
        components new_resource.repo_components['debian']
        action :add
      end

      # set apt pin priority
      apt_preference 'netuitive' do
        pin 'version ' + new_resource.version
        pin_priority new_resource.repo_priority_pins['debian']
      end
    when 'rhel', 'fedora'
      Chef::Log.warn 'EPEL based system support is still in the works, please submit an issue on github for any issues you have'
      # we can only use yum-plugin-versionlock if we enable epel repos
      if new_resource.use_epel_repos
        yum_repository 'epel' do
          description 'Extra Packages for Enterprise Linux'
          mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
          gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
          action :create
        end
        # add the yum-plugin-versionlock package
        yum_package 'yum-plugin-versionlock' do
          action :install
        end
      else
        Chef::Log.warn 'Warning: We are not going to version lock unless you allow EPEL repos'
      end
      # add the repo
      yum_repository 'netuitive' do
        description 'Netuitive EPEL Repo'
        url new_resource.repo_urls['rhel']
        gpgkey new_resource.repo_keys['rhel']
        gpgcheck true
        priority new_resource.repo_priority_pins['rhel']
      end
    end
  end
end
