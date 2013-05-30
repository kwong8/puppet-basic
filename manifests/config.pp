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
class basic::config {
    $config_ntp_servers = $basic::ntp_server

    file { 
        # Timezone setup
        "/etc/localtime":
            ensure => links,
            target => "/usr/share/zoneinfo/${basic::timezone}";

        "/etc/timezone": 
            content => "${basic::timezone}\n";

        "/etc/ntp.conf":
            ensure  => file,
            content => template("basic/ntp.conf.erb");
    }

    exec { 
        "updatedb":
            unless => "test -f /var/lib/mlocate/mlocate.db";
    }

    if $basic::your_ssh_public_key != "" {
        user {
            "${basic::server_user}":
                ensure => present;
        }

        ssh_authorized_key {
            "your_public_key":
                ensure  => present,
                key     => "${basic::your_ssh_public_key}",
                user    => "${basic::server_user}",
                type    => "ssh-rsa",
                require => [User["${basic::server_user}"],];       
        }
    }
}
