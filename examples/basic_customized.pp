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
node your_server_hostname {
  #
  # Custom Variables
  #
  
  #
  # Server configuration
  #
  class {
    "basic":
      prefered_packages_list  => ["emacs"],                               # Default values: ["build-essential","tcpdump","traceroute","vim","vim-nox","sudo","strace","aptitude",],
      timezone                => "America/Montreal",                      # Your timezone location, default "America/Montreal"
      ntp_server              => ["ntp.ubuntu.com","ntp.dyndns.org",],    # Default ntp servers: ["time.nrc.ca","time.chu.nrc.ca",]
      your_ssh_public_key     => "generally a long string of hex digits", # Your desktop ssh public key, default empty
      server_user             => "root";                                  # The user under who we will set your ssh public key, default "root"
  }

  # Modules
  include basic
}
