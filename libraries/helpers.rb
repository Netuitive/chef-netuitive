module NetuitiveCookbook
  module Helpers
    def determine_platform
      platform_family = node['platform_family']
      return platform_family
    end

    def determine_version(new_resource, node)
      if new_resource.version
        new_resource.version.to_s
      elsif node['netuitive'] && node['netuitive']['version']
        node['netuitive']['version'].to_s
      else
        raise 'could not determine version of netuitive agent to install'
      end
    end

    def systemd?
      IO.read('/proc/1/comm').chomp == 'systemd'
    end

    def upstart?
      File.executable?('/sbin/initctl')
    end

    def determine_init_subsytem
      if systemd?
        'systemd'
      elsif upstart?
        'upstart'
      else
        'initd'
      end
    end

    def determine_repo_urls(new_resource, node)
      if new_resource.repo_urls
        new_resource.repo_urls.to_h
      elsif node['netuitive'] && node['netuitive']['repo']['urls']
        node['netuitive']['repo']['urls'].to_h
      else
        raise 'could not get a hash of repo_urls'
      end
    end

    def determine_repo_keys(new_resource, node)
      if new_resource.repo_keys
        new_resource.repo_keys.to_h
      elsif node['netuitive'] && node['netuitive']['repo']['keys']
        node['netuitive'] && node['netuitive']['repo']['keys'].to_h
      else
        raise 'could not get a hash of repo_keys'
      end
    end

    def determine_repo_components(new_resource, node)
      if new_resource.repo_components
        new_resource.repo_components.to_h
      elsif node['netuitive'] && node['netuitive']['repo']['components']
        node['netuitive'] && node['netuitive']['repo']['components'].to_h
      else
        raise 'could not get a list of repo_components'
      end
    end

    def determine_repo_priority_pins(new_resource, node)
      if new_resource.repo_priority_pins
        new_resource.repo_priority_pins.to_h
      elsif node['netuitive'] && node['netuitive']['repo']['priority_pins']
        node['netuitive'] && node['netuitive']['repo']['priority_pins'].to_h
      else
        raise 'could not get a hash of repo_priority_pins'
      end
    end

    def determine_collectors_dir(new_resource, node)
      if new_resource.collectors_dir
        new_resource.custom_collectors.to_s
      elsif node['netuitive'] && node['netuitive']['collectors_dir']
        node['netuitive'] && node['netuitive']['collectors_dir'].to_h
      else
        raise 'could not get a string of the collector dir'
      end
    end

    def determine_custom_collectors(new_resource, node)
      if new_resource.custom_collectors
        new_resource.custom_collectors.to_h
      elsif node['netuitive'] && node['netuitive']['custom_collectors']
        node['netuitive'] && node['netuitive']['custom_collectors'].to_h
      else
        raise 'could not get a hash of collectors'
      end
    end
  end
end
