#
# Cookbook Name:: loggly_rsyslog_ng
# Resource:: tls
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

actions :create, :remove 
default_action :create

attribute :cert_name, :kind_of => [String, NilClass], :name_attribute => true, :default => 'rsyslog.loggly.crt'
attribute :cert_path, :kind_of => [String], :default => '/etc/rsyslog.d/keys/ca.d'
attribute :cert_from_file, :kind_of => [TrueClass, FalseClass], :default => true
attribute :cookbook, :kind_of => [String], :default => 'loggly_rsyslog_ng'
attribute :source, :kind_of => [String, NilClass], :default => 'rsyslog.loggly.crt'
attribute :cert_url, :kind_of => [String], :default => 'https://logdog.loggly.com/media/loggly.com.crt'
attribute :cert_checksum, :kind_of => [String], :default => '69559ef5e65be40abf939cc2ecb7380df3c6a7fa86386f02a1be395cad6afa6d'
attribute :intermediate_cert_url, :kind_of => [String], :default => 'https://certs.starfieldtech.com/repository/sf_bundle.crt'
attribute :intermediate_cert_checksum, :kind_of => [String], :default => '87d171b3333ca95a98aa02603fdb6508939c63f69e14c8587bd66c4f4df65032'
