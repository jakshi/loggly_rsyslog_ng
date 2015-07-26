Loggly rsyslog LWRP
================
Provide LWRP for configuring rsyslog for use with [Loggly](http://loggly.com). This cookbook was built upon the work from an existing cookbook, https://github.com/kdaniels/loggly-rsyslog.

Requirements
------------
- Chef 11 or higher
- **Ruby 2.0.0 or higher**

Platform
--------
Tested against Debian 7

Usage
-----------------
```
loggly_rsyslog_ng '/etc/rsyslog.d/22-loggly.conf' do
  loggly_token      'my_very_secret_token'
  tags              [ node.chef_environment ]
end
```

Resources
----------
### default
* `tags` - A list of event tags to apply to a message (https://www.loggly.com/docs/tags/) (optional)

* `log_files` - A list of files rsyslog should monitor. (optional). Below is an example
of a hash used to describe a file to monitor.

```
    {
        :filename => "/var/log/filename.log",
        :tag => "tag you want for this logfile",
        :statefile => "unique-name-for-statefile",
		:facility => 'local5' # Optional
    }
```

* `log_dirs` - A list of directories to monitor (optional). The loggly configuration template will create an [imfile](http://www.rsyslog.com/doc/imfile.html) block for each file ending in '.log' in that directory. Each logdir in the list is of the format:

```
    {
        :directory => "/var/log/directory",
        :tag => "tag for all files in this directory",
		:facility => 'local5' # Optional
    }
```

* `tls_enabled` - Set to true if communication to the remote service should use TLS (defaults to true)
* `tls_path` - Directory where the loggly certificate should be placed
* `tls_name` - File where the loggly certificate should be placed
* `loggly_value` - The Loggly token. Set from the Data Bag above by default.

* `conf` - Name of the loggly rsyslog confiugration file (defaults to /etc/rsyslog.d/10-loggly.conf)
* `host` - Name of the remote loggly syslog host (defaults to logs-01.loggly.com)
* `port` - Port of the remote loggly syslog host (defaults to 514 and if TLS is enabled to 6514)
* `input_file_poll_interval` - Specifies how often files are to be polled for new data (defaults to 10)

### tls

* `tls_cert_url` - Url to the loggly.com certificate
* `tls_intermediate_cert_url` - Url to the intermediate certificate
* `tls_cert_checksum` - Cchecksum of the loggly.com certificate
* `tls_intermediate_cert_checksum` - Checksum of the intermediate certificate

License & Authors
-----------------
- Author: Matt Veitas <mveitas@gmail.com>
- Author: Kostiantyn Lysenko <gshaud@gmail.com>

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
