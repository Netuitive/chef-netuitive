Netuitive Cookbook (Chef)
==========================

[![Build Status](https://travis-ci.org/Netuitive/chef-netuitive.svg?branch=master)](https://travis-ci.org/Netuitive/chef-netuitive) [![Join the chat at https://gitter.im/Netuitive/chef-netuitive](https://badges.gitter.im/Netuitive/chef-netuitive.svg)](https://gitter.im/Netuitive/chef-netuitive?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/Netuitive/chef-netuitive/master/LICENSE)

A cookbook to automate the installataion and configuration of the Netuitive Linux agent. For more 
information on the Netuitive Linux Agent, see the [help docs](https://help.netuitive.com/Content/Misc/Datasources/Netuitive/new_netuitive_datasource.htm) or contact Netuitive support at [support@netuitive.com](mailto:support@netuitive.com).

Requirements/Dependencies
==========================

### Officially Supported Platforms
Debian 8, Ubuntu 14.04 LTS, CentOS 6.5, and CentOS 7. Automated testing will be performed to ensure coverage of these platforms.

### Not officially Supported
We will attempt to support as many linux distributions as possible and are hoping to expand the above list over time. Any EPEL based system that still supports yum will likely work and we are open to PRs to expands functionality.

Using the Netuitive Cookbook
=============================

### Recipes
All recipes are simple wrappers around the lightweight resources and providers (LWRPs). We suggest using LWRPs over recipes as it will provide flexibility.

<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>netuitive::default</td>
        <td>Does nothing.</td>
    </tr>
    <tr>
        <td>netuitive::add_repo</td>
        <td>Adds the Netuitive repo.</td>
    </tr>
    <tr>
        <td>netuitive::configure</td>
        <td>Sets base and custom config.</td>
    </tr>
    <tr>
        <td>netuitive::install_agent</td>
        <td>Installs the agent.</td>
    </tr>
</table>

### LWRPs

#### Configure
Actions: `:create`

Attributes:
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>api_key</td>
        <td>Your datasource's API key.</td>
    </tr>
    <tr>
        <td>conf_path</td>
        <td>The path to your Netuitive agent config file.</td>
    </tr>
    <tr>
        <td>cookbook_template</td>
        <td>Specifies a different cookbook that the template can come from.</td>
    </tr>
    <tr>
        <td>custom_config_path</td>
        <td>Path to your Netuitive agent custom config file.</td>
    </tr>
    <tr>
        <td>custom_vars</td>
        <td>Any variables you want to include in the custom config file.</td>
    </tr>
    <tr>    
        <td>source</td>
        <td>The name of the template.</td>
    </tr>
</table>

#### Install
Actions: `:install`

Attributes:
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>package_name</td>
        <td>The package's name.</td>
    </tr>
</table>

#### Repo
Actions: `:add`

Attributes:
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>version</td>
        <td>The version to pin.</td>
    </tr>
    <tr>
        <td>repo_urls</td>
        <td>A hash of platform-specific repository URLs.</td>
    </tr>
    <tr>
        <td>repo_keys</td>
        <td>A hash of platform-specific repository GPG keys.</td>
        
    </tr>
    <tr>
        <td>repo_components</td>
        <td>A hash of platform-specific components.</td>
        
    </tr>
    <tr>
        <td>package_options</td>
        <td>A string with package-specific options.</td>
    </tr>
</table>

Additional Information
============

### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['netuitive']['version']</tt></td>
    <td>string</td>
    <td>The version of the agent to install</td>
    <td><tt>'0.2.3-70'</tt></td>
  </tr>
  <tr>
    <td><tt>node['netuitive']['repo']['urls']</tt></td>
    <td>Hash</td>
    <td>A hash of platform specific repo urls</td>
    <td><tt>{
      'debian' => 'https://repos.app.netuitive.com/deb/',
      'rhel' => 'https://repos.app.netuitive.com/rpm/noarch'
    }
    </tt></td>
  </tr>
  <tr>
    <td><tt>node['netuitive']['repo']['keys']</tt></td>
    <td>Hash</td>
    <td>A hash of platform specific repo gpg key locations</td>
    <td><tt>{
      'debian' => 'https://repos.app.netuitive.com/netuitive.gpg',
      'rhel' => 'https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive'
    }
    </tt></td>
  </tr>
  <tr>
    <td><tt>node['netuitive']['repo']['components']</tt></td>
    <td>Hash</td>
    <td>A hash of platform specific compnents</td>
    <td><tt>{
      'debian' => ['stable', 'main']
    }
    </tt></td>
  </tr>

</table>