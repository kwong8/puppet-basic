#
# This file is part of puppet-phpsysinfo ( https://github.com/drivard/puppet-phpsysinfo ).
#
# Copyright (C) 2011 Dominick Rivard <dominick.rivard@gmail.com>
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
#
class basic
(
  $prefered_packages_list = ["build-essential","tcpdump","traceroute","vim","vim-nox","sudo","strace","aptitude",],
  $timezone = "America/Montreal",
  $ntp_server = ["time.nrc.ca","time.chu.nrc.ca",],
  $your_ssh_public_key = "",
  $server_user = "root"
)
{ 
  # Includes
  include basic::install, basic::config, basic::service
  
  # Module Dependencies
  Class['basic::install'] -> Class['basic::config'] -> Class['basic::service']
  Class['basic::config'] ~> Class['basic::service']
}
