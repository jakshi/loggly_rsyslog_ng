#
# Cookbook Name:: loggly_rsyslog_ng
# Resource:: default
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

actions :install

default_action :install

attribute :conf, :kind_of => [String, NilClass], :name_attribute => true, :default => '/etc/rsyslog.d/22-loggly.conf'
attribute :loggly_token, :kind_of => [String, NilClass], :default => nil, :required => true
attribute :install_rsyslog, :kind_of => [TrueClass, FalseClass], :default => true
attribute :install_tls_certs, :kind_of => [TrueClass, FalseClass], :default => true
attribute :tags, :kind_of => [Array], :default => []
attribute :log_files, :kind_of => [Array], :default => []
attribute :log_dirs, :kind_of => [Array], :default => []
attribute :enable_tls, :kind_of => [TrueClass, FalseClass], :default => true
attribute :tls_name, :kind_of => [String, NilClass], :default => 'rsyslog.loggly.crt'
attribute :tls_path, :kind_of => [String], :default => '/etc/rsyslog.d/keys/ca.d'
attribute :host, :kind_of => [String], :default => 'logs-01.loggly.com'
attribute :port, :kind_of => [Integer, NilClass], :default => nil
attribute :input_file_poll_interval, :kind_of => [Integer], :default => 10
attribute :cookbook, :kind_of => [String], :default => 'loggly_rsyslog_ng'
attribute :source, :kind_of => [String], :default => 'rsyslog-loggly.conf.erb'
