#
# Cookbook Name:: loggly_rsyslog_ng
# Recipe:: default
#
# Author: Matt Veitas mveitas@gmail.com
# Author: Kostiantyn Lysenko gshaud@gmail.com
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


if node['loggly']['token']['from_databag']
  databag = node['loggly']['token']['databag']
  databag_item = node['loggly']['token']['databag_item']

  loggly_token = Chef::EncryptedDataBagItem.load(databag, databag_item)['token']
  raise "No token was found in databag item: #{databag}/#{databag_item}" if loggly_token.nil?
else
  raise "When not using a Data Bag, you have to define the Loggly token manually" if node['loggly']['token']['value'].empty?
  loggly_token = node['loggly']['token']['value']
end

include_recipe "rsyslog::default"

include_recipe "loggly_rsyslog_ng::tls" if node['loggly']['tls']['enabled']

template node['loggly']['rsyslog']['conf'] do
  source 'rsyslog-loggly.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables({
    :monitor_files => !node['loggly']['log_files'].empty? || !node['loggly']['log_dirs'].empty?,
    :tags => node['loggly']['tags'].nil? || node['loggly']['tags'].empty? ? '' : "tag=\\\"#{node['loggly']['tags'].join("\\\" tag=\\\"")}\\\"",
    :token => loggly_token
  })
  notifies :restart, "service[rsyslog]", :immediate
end
