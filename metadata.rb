# frozen_string_literal: true

name             'netuitive'
maintainer       'Ben Abrams'
maintainer_email 'me@benabrams.it'
license          'MIT'
description      'Installs/Configures netuitive/metricly'
long_description 'Installs/Configures netuitive/metricly monitoring agent'

chef_version     '>= 14.0' if respond_to?(:chef_version)
issues_url       'https://github.com/Netuitive/chef-netuitive/issues' if respond_to?(:issues_url)
source_url       'https://github.com/Netuitive/chef-netuitive' if respond_to?(:source_url)

version          '1.0.0'

depends 'apt', '~> 7.0'
depends 'yum'

%w[ubuntu debian centos redhat].each do |os|
  supports os
end
