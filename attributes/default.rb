# version
default['netuitive']['version'] = '0.2.8-97'

# do we want to add a repo?
default['netuitive']['add_repo'] = true

# repo_urls
default['netuitive']['repo']['urls'] = {
  'debian' => 'https://repos.app.netuitive.com/deb/',
  'rhel' => 'https://repos.app.netuitive.com/rpm/$basearch/'
}

# repo keys to import
default['netuitive']['repo']['keys'] = {
  'debian' => 'https://repos.app.netuitive.com/netuitive.gpg',
  'rhel' => 'https://repos.app.netuitive.com/RPM-GPG-KEY-netuitive'
}

# repo priority pins
default['netuitive']['repo']['priority_pins'] = {
  'debian' => '700',
  'rhel' => '10'
}

# repo components
default['netuitive']['repo']['components'] = {
  'debian' => ['stable', 'main']
}

default['netuitive']['custom_collectors'] = {}
