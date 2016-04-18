# netuitive cookbook

[![Build Status](https://travis-ci.org/Netuitive/chef-netuitive.svg?branch=master)](https://travis-ci.org/Netuitive/chef-netuitive)
[![Join the chat at https://gitter.im/Netuitive/chef-netuitive](https://badges.gitter.im/Netuitive/chef-netuitive.svg)](https://gitter.im/Netuitive/chef-netuitive?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/Netuitive/chef-netuitive/master/LICENSE)

A cookbook to install and configure the netuitive agent.

## Supported Platforms

### Officially Supported
We will officially support debian 8, ubuntu 14.04 LTS, centos 6.5, and centos7 and will do automated testing to ensure that we have coverage on these.

### Not officially Supported
We will attempt to support as many linux distributions as possible and are hoping to expand the above list over time. Any EPEL based system that still supports yum will likely work and we are open to PRs to expands functionality.


## Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `node['netuitive']['version']` | string | The version of the agent to install | `'0.2.6-95'`|
| `node['netuitive']['repo']['urls']` | Hash | A hash of platform specific repo urls | `{ 'debian' => 'https://repos.app.netuitive.com/deb/', 'rhel' => 'https://repos.app.netuitive.com/rpm/noarch' }` |
| `node['netuitive']['repo']['keys']` | Hash | A hash of platform specific repo gpg key locations | `{ 'debian' => 'https://repos.app.netuitive.com/netuitive.gpg', 'rhel' => 'https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive' }` |
| `node['netuitive']['repo']['components']` | Hash | A hash of platform specific compnents | `{ 'debian' => ['stable', 'main'] }` |

## Recipes

All recipes are simple wrappers around the LWRPS, I would recommend you always use LWRPS over recipes as it will give you flexibility.

### netuitive::default

Does nothing.

### netuitive::add_repo

Adds the netuitive repo

### netuitive::configure

Sets base and custom config.

### netuitive::install_agent

Installs the agent.

## LWRPS

### Configure

Actions: `:create`

Attributes:
- api_key: your data source API Key
- conf_path: path to the netuitive agent config file
- cookbook template: allows you to specify a different cookbook that the template can come from
- custom_config_path: where your custom netuitive config
- custom_vars: any vars you want to include in custom config
- source: the name of the template

### Install

Actions: `:install`

Attributes:
- package_name: the package name

### Repo

Actions: `:add`

Attributes:
- version: the version to pin
- repo_urls: a hash of platform specific repo urls
- repo_keys: a hash of platform specific repo gpg keys
- repo_components: a hash of platform specific components
- package_options: a string with package specific options

## License and Authors
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
