# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

- added `docker_collector_metrics_whitelist`

## 0.21.0.2-0.21.6
- no-op testing travis supermarket deploys

## 0.21.1
- properly reflected in metadata the reality regarding licensing and chef_version support (@majormoses)

## 0.21.0
- added `batch_size` @johvet

# 0.20.0
- added `disk_space_collector_exclude_filters` @johvet

# 0.19.0
- added `statsd_prefix` option to `netuitive_configure`

# 0.18.0
- added travis deploys to supermarket @TheConnMan

# 0.17.1
- changed to use chef-client 12.16
- fixed issue with apt repository creation per #49. @Createor

# 0.17.0
- bump default collector agent version @Createor

# 0.16.0
- added support for Ubuntu 16.04 LTS and made it an an officially supported platforms
- updating gem dependencies
- removed ruby 2.1 support
- removed chef 11 testing as its support exists in its own branch and I would not expect any more work done on it.
- setup travis to run kitchen tests for centos-6 and centos-7 (more to come later)

# 0.15.1
- fixes template issues when using statsd that were caused in #46. @ziggythehamster

# 0.15.0
- added `statsd_forward`, `statsd_forward_ip`, `statsd_forward_port`, `statsd_listen_ip`, and `statsd_listen_port` options to `netuitive_configure` @ziggythehamster

# 0.14.0
- added `disk_usage_collector_metrics_whitelist` @ziggythehamster
- improved README.md @ziggythehamster

## 0.13.0
- fix typos in tags and relations @ziggythehamster
- fix typo with logger repo provider @ziggythehamster
- added `docker_collector_enabled` @ziggythehamster


## 0.12.0
- adding some tools for making versioning and tagging easier
- adding doc on chef version compatibility
- restructure testing to allow multiple versions to be developed and tested

## 0.11.0 (cheff 11 branch)
- adding some tools to make versioning easier
- adding doc on chef version compatibility
- chef 11 support (not compatible with 12 so its in its own branch)
- restructure testing to allow multiple versions to be developed and tested

## 0.10.0
- make sure that agent restarts when custom collector config changes (is added).

## 0.9.0
- Update to latest Netuitive-agent (0.2.9-98)

## 0.8.0
- cleanup deprecated code

## 0.7.0
- Update to latest Netuitive-agent (0.2.8-97)

## 0.6.0
- Update to latest Netuitive-agent (0.2.7-96)

## 0.4.0
- Update to latest Netuitive-agent (0.2.6-95)
- Update default netuitive-agent.conf template

## 0.3.1
### Fixed
- bad metadata for platforms supported

## 0.3.0
### Added
- Support for epel based systems

## 0.2.0
### Added
- foodcritic testing
### Changed
- All LWRPs use `use_inline_resources` to address foodcritic ~FC057

## 0.1.1
- Update to latest Netuitive-agent (0.2.3-70)

## 0.1.0
- Initial release of netuitive
