#
# Cookbook Name:: loggly_rsyslog_ng_test_helper
# Recipe:: default
#
# Copyright 2015 Kostiantyn Lysenko
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

::File.open('/var/log/testlog', 'w') {|f| f.write("this is a test log file\n") }

service 'rsyslog' do
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action :nothing
end

loggly_rsyslog_ng 'syslog' do
  log_filename '/var/log/syslog'
  loggly_token  node['loggly']['token']
  loggly_tags          [ 'test-kitchen' ]
  rsyslog_selector   ':syslogtag, isequal, "testlog:"'
  rsyslog_tag        'testlog'
end

service 'rsyslog' do
  action :restart
end

file '/var/log/testlog' do
  content IO.read('/var/log/testlog') + "test string 1\n"
end
