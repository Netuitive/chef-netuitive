name             'netuitive'
maintainer       'Ben Abrams'
maintainer_email 'me@benabrams.it'
license          'All rights reserved'
description      'Installs/Configures netuitive'
long_description 'Installs/Configures netuitive'
version          '0.9.0'

depends 'apt'
depends 'yum'

%w(ubuntu debian centos redhat).each do |os|
  supports os
end
