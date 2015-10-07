loggly_rsyslog_ng Cookbook CHANGELOG
==========================
This file is used to list changes made in each version of the loggly_rsyslog_ng cookbook.

v5.0.0
------------------

- Add: rainerscript config for rsyslog 7.6.x+
- Modify: from now on all major enhancements will be performed for
  rsyslog 7.6.x+ version of configs. Older rsyslog 5.8.x config format
  will be supported in legacy mode.
- Add: setting a names for action queues
- Add: separate main queue for each log that we send to loggly
- Add: disk assisted action queue for every added action.
- Add: creates log file and directory if it doesn't exist
- Modify: now resource will define logging for only one file.
- Modify: some attributes names for better clarity.
- Remove: support of facilities, I'll use different rulesets, so
  facilities is not neccessary

v4.3.0
------------------

- Add: test-kitchen setup for AWS and fixture cookbook for testing
LWRP
- Fix: calling loggy_rsyslog_ng_tls provider inside loggy_rsyslog_ng
provider

v4.2.0
------------------

- Add: installing loggly certificate from file by default. network connection is not reliable.

v4.1.0
------------------

- Add: optional facility opgion go log_file and log_dir hashes.

v4.0.0
------------------

- Modify: rewrite the cookbook as LWRP

v3.0.0
------------------

- Modify: fork cookbook from loggly-rsyslog cookbook
- Modify: cookbook name, from loggly-rsyslog to loggly_rsyslog_ng to avoid name collisions
- Fix: checksum for loggly SSL certificate

v2.0.0
------------------
- Use an encrypted databag to retrieve the loggly token instead of a node attribute

v1.0.1
-------------------
- Set rsyslog configuration values to be configurable via attributes

v1.0.0 (1/25/2014)
-------------------
- Initial cookbook version
- Support for sending messages using TLS
- Configuration for monitoring a list of files
- Configuration for monitoring a list of directories
