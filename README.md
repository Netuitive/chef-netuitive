Netuitive Cookbook (Chef)
==========================

[![Build Status](https://travis-ci.org/Netuitive/chef-netuitive.svg?branch=master)](https://travis-ci.org/Netuitive/chef-netuitive) [![Join the chat at https://gitter.im/Netuitive/chef-netuitive](https://badges.gitter.im/Netuitive/chef-netuitive.svg)](https://gitter.im/Netuitive/chef-netuitive?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/Netuitive/chef-netuitive/master/LICENSE)

A cookbook to automate the installation and configuration of the Netuitive Linux agent. For more
information on the Netuitive Linux Agent, see the [help docs](https://help.netuitive.com/Content/Misc/Datasources/Netuitive/new_netuitive_datasource.htm) or contact Netuitive support at [support@netuitive.com](mailto:support@netuitive.com).

This cookbook is meant to be consumed by wrapper cookbooks such as this: [wrapper cookbook](https://github.com/CloudCruiser/ops_chef-cc_netuitive)

### Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `node['netuitive']['version']` | String | The version of the agent to install | `'0.2.9-98'`|
| `node['netuitive']['repo']['urls']` | Hash | A hash of platform specific repo urls | `{ 'debian' => 'https://repos.app.netuitive.com/deb/', 'rhel' => 'https://repos.app.netuitive.com/rpm/noarch' }` |
| `node['netuitive']['repo']['keys']` | Hash | A hash of platform specific repo gpg key locations | `{ 'debian' => 'https://repos.app.netuitive.com/netuitive.gpg', 'rhel' => 'https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive' }` |
| `node['netuitive']['repo']['components']` | Hash | A hash of platform specific compnents | `{ 'debian' => ['stable', 'main'] }` |
| `node['netuitive']['custom_collectors']` | Hash | A hash of collectors and options | `{}` |

Supported Platforms
--------------------

### Operating Systems

#### Official
Supported and tested locally with vagrant:
- Ubuntu 16.04 LTS
- Ubuntu 14.04 LTS
- CentOS 6.7+
- Centos 7.2+
- Debian 8

Tested platforms by travisci:
- centos 6
- centos 7

#### Unofficial
We will attempt to support as many linux distributions as possible and are hoping to expand the above list over time. Any EPEL based system that still supports yum will likely work and we are open to PRs to expands functionality.

### Chef Versions
#### Chef 12.x
We support all versions of 12.x (even if we don't test it regularly).

#### Chef 11.x
We have written this cookbook using many of the nicer things of chef 12. We are open to community contributions to enable/improve the cookbook to support older versions of chef within reason. If you need chef 11 support in the mean time please see the  `feature/chef-11-compatibility` branch.

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
| Name | Description | Default |
|:------:|-------------|-------------|
| api_key | Your datasource's API key. | `'CHANGE_ME_PLZ'` |
| api_url | The API url for netuitive. | `'https://api.app.netuitive.com/ingest/infrastructure'` |
| batch_size | Number of samples to store before sending to Metricly | `500` |
| conf_path | The path to your Netuitive agent config file. | `'/opt/netuitive-agent/conf/netuitive-agent.conf'` |
| cookbook_template | Specifies a different cookbook that the template can come from. | `'netuitive'` |
| disk_space_collector_exclude_filters | Specifies an exclude filter for metrics | `^/boot, ^/mnt` |
| disk_usage_collector_metrics_whitelist | Specifies the metrics whitelist for the DiskUsageCollector. You might change this if you wanted to ignore the Docker device mapper metrics. | `'(?:^.*\.io$|^.*\.average_queue_length$|^.*\.await$|^.*\.iops$|^.*\.read_await$|^.*\.reads$|^.*\.util_percentage|^.*\.write_await$|^.*\.writes$)'` |
| docker_collector_enabled | Whether or not to enable the Docker collector. May be `true` or `false`. | `false` |
| docker_collector_metrics_whitelist | Specifies the metrics whitelist for the NetuitiveDockerCollector. | `null` |
| relations | An array of relations. | `[]` |
| source | The name of the template. | `'netuitive-agent.conf.erb'` |
| statsd_enabled | Whether to enable embedded statsd server. Specify the string `'True'` or `'False'` | `'False'` |
| statsd_forward | Whether or not to forward stats from the embedded statsd server. May be `true` or `false` | `false`
| statsd_forward_ip | The IP to forward statsd data to if forwarding is enabled. | `'127.0.0.1'`
| statsd_forward_port | The port to forward statsd data to if forwarding is enabled. | `9125`
| statsd_listen_ip | The interface to listen on if statsd is enabled. | `'127.0.0.1'`
| statsd_listen_port | The port the embedded statsd listens on | `8125` |
| statsd_prefix | Prefix applied to your statsd metrics | `statsd` |
| tags | An array of tags . | `[]` |

#### netuitive_collector

##### Actions
`:create`

##### Attributes
| Name | Description | Default |
|:------:|-------------|-------------|
| conf_path | The path to your Netuitive agent config file. | `'/opt/netuitive-agent/conf/netuitive-agent.conf'` |
| cookbook_template | Specifies a different cookbook that the template can come from. | `'netuitive'` |
| collectors_dir | Dir that custom collectors live in. | `'/opt/netuitive-agent/conf/collectors'` |
| custom_collectors | A hash of collectors and options to create. | `{}` |
| source | The name of the template. | `'collector_generic.conf.erb'` |

#### netuitive_install

##### Actions
`:install`

##### Attributes
| Name | Description | Default |
|:------:|-------------|-------------|
| package_name | The package's name. | `'netuitive-agent'` |

#### netuitive_repo

##### Actions
`:add`

##### Attributes
| Name | Description | Default |
|:------:|-------------|-------------|
| repo_components | A hash of platform-specific components. | `nil` |
| repo_keys | A hash of platform-specific repository GPG keys. | `nil` |
| repo_priority_pins | A hash of platform-specific repo pins. | `nil` |
| repo_urls | A hash of platform-specific repository URLs. | `nil` |
| use_epel_repos | Bool value to enable EPEL repos (doesn't do anything on Debian-based repos). | `nil` |
| version | The version to pin. | `nil` |


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
