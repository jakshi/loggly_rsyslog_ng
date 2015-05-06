loggly_rsyslog_ng Cookbook CHANGELOG
==========================
This file is used to list changes made in each version of the loggly_rsyslog_ng cookbook.

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
