Netuitive Cookbook (Chef)
==========================

[![Build Status](https://travis-ci.org/Netuitive/chef-netuitive.svg?branch=master)](https://travis-ci.org/Netuitive/chef-netuitive) [![Join the chat at https://gitter.im/Netuitive/chef-netuitive](https://badges.gitter.im/Netuitive/chef-netuitive.svg)](https://gitter.im/Netuitive/chef-netuitive?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/Netuitive/chef-netuitive/master/LICENSE)

A cookbook to automate the installataion and configuration of the Netuitive Linux agent. For more
information on the Netuitive Linux Agent, see the [help docs](https://help.netuitive.com/Content/Misc/Datasources/Netuitive/new_netuitive_datasource.htm) or contact Netuitive support at [support@netuitive.com](mailto:support@netuitive.com).

### Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `node['netuitive']['version']` | string | The version of the agent to install | `'0.2.8-97'`|
| `node['netuitive']['repo']['urls']` | Hash | A hash of platform specific repo urls | `{ 'debian' => 'https://repos.app.netuitive.com/deb/', 'rhel' => 'https://repos.app.netuitive.com/rpm/noarch' }` |
| `node['netuitive']['repo']['keys']` | Hash | A hash of platform specific repo gpg key locations | `{ 'debian' => 'https://repos.app.netuitive.com/netuitive.gpg', 'rhel' => 'https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive' }` |
| `node['netuitive']['repo']['components']` | Hash | A hash of platform specific compnents | `{ 'debian' => ['stable', 'main'] }` |
| `node['netuitive']['custom_collectors']` | Hash | A hash of collectors and options | `{}` |

Supported Platforms
--------------------

### Official
Debian 8, Ubuntu 14.04 LTS, CentOS 6.5, and CentOS 7. Automated testing will be performed to ensure coverage of these platforms.

### Unofficial
We will attempt to support as many linux distributions as possible and are hoping to expand the above list over time. Any EPEL based system that still supports yum will likely work and we are open to PRs to expands functionality.

Using the Netuitive Cookbook
-----------------------------

### Recipes
All recipes are simple wrappers around the lightweight resources and providers (LWRPs). We suggest using LWRPs over recipes as it will provide flexibility.

| Name | Description |
|:------:|-------------|
| netuitive::default | Does nothing. |
| netuitive::add_repo | Adds the Netuitive repo. |
| netuitive::configure | Sets base and custom config. |
| netuitive::install_agent | Installs the agent. |

### LWRPs

#### netuitive_configure

##### Actions
`:create`

##### Attributes
| Name | Description |
|:------:|-------------|
| api_key | Your datasource's API key. |
| conf_path | The path to your Netuitive agent config file. |
| cookbook_template | Specifies a different cookbook that the template can come from. |
| custom_config_path | Path to your Netuitive agent custom config file. |
| custom_vars | Any variables you want to include in the custom config file. |
| source | The name of the template. |

#### netuitive_collector

##### Actions
`:create`

##### Attributes
| Name | Description |
|:------:|-------------|
| conf_path | The path to your Netuitive agent config file. |
| cookbook_template | Specifies a different cookbook that the template can come from. |
| collectors_dir | Dir that custom collectors live in. |
| custom_collectors | A hash of collectos and options to create. |
| source | The name of the template. |

#### netuitive_install

##### Actions
`:install`

##### Attributes
| Name | Description |
|:------:|-------------|
| package_name | The package's name. |

#### netuitive_repo

##### Actions
`:add`

##### Attributes
| Name | Description |
|:------:|-------------|
| version | The version to pin. |
| repo_urls | A hash of platform-specific repository URLs. |
| repo_keys | A hash of platform-specific repository GPG keys. |
| repo_components | A hash of platform-specific components. |
| package_options | A string with package-specific options. |

Additional Information
-----------------------

### License and Authors
This software is licensed under MIT license quoted below:

```
The MIT License (MIT)

Copyright (c) 2016 Ben Abrams

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
