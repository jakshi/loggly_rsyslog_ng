name             'loggly_rsyslog_ng'
maintainer       'Kostiantyn Lysenko'
maintainer_email 'gshaud@gmail.com'
license          'Apache 2.0'
description      'LWRP for configuring rsyslog to send data to Loggly'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '5.1.0'

supports 'debian'

depends "apt"
depends "rsyslog"
