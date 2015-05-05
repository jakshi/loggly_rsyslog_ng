#
# Cookbook Name:: loggly_rsyslog_ng
# Provider:: default
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

def whyrun_supported?
  true
end

use_inline_resources

action :install do

  if new_resource.install_rsyslog
    %w{rsyslog rsyslog-gnutls}.each { |pkg| package pkg }
  end

  service "rsyslog" do
    supports :status => true, :restart => true, :reload => true
    action :nothing
  end
  
  if new_resource.install_tls_certs
    loggy_rsyslog_ng_tls
  end
  
  template new_resource.conf do
    source new_resource.source
    cookbook new_resource.cookbook
    owner 'root'
    group 'root'
    mode 0644
    variables({
      :monitor_files => !new_resource.log_files.empty? || !new_resource.log_dirs.empty?,
      :tags => new_resource.tags.nil? || new_resource.tags.empty? ? '' : "tag=\\\"#{new_resource.tags.join("\\\" tag=\\\"")}\\\"",
      :token => new_resource.loggly_token
    })
    notifies :restart, "service[rsyslog]", :delayed
  end
end

protected
