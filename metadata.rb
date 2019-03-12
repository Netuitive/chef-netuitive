# frozen_string_literal: true

name             'netuitive'
maintainer       'Ben Abrams'
maintainer_email 'me@benabrams.it'
license          'MIT'
description      'Installs/Configures netuitive'
long_description 'Installs/Configures netuitive'

# TODO: drop chef 12 support, chef 13 is about to be EOL
chef_version     '>= 12.5' if respond_to?(:chef_version)
issues_url       'https://github.com/Netuitive/chef-netuitive/issues' if respond_to?(:issues_url)
source_url       'https://github.com/Netuitive/chef-netuitive' if respond_to?(:source_url)

version          '0.21.0'

depends 'apt'
depends 'yum'

%w[ubuntu debian centos redhat].each do |os|
  supports os
end
