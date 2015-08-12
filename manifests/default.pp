# include '::rabbitmq'
# include epel
# include staging
# class { 'erlang': epel_enable => true}

# include '::service:upstart'

class { 'rabbitmq':
    port                    => '5672',
    service_manage          => true,
    delete_guest_user => true,
    # refreshonly => true
    # environment_variables   => {
    #     'RABBITMQ_NODENAME'     => 'server',
    #     'RABBITMQ_SERVICENAME'  => 'rabbitMQ'
    # }
}

# $server_lsbdistcodename = downcase($::lsbdistcodename)

# class { 'apt':  
#     always_apt_update => true,
# }

# apt::source { 'mongodb-org-3.0':
#     location    => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart/',
#     release     => "${server_lsbdistcodename}/mongodb-org/3.0",
#     repos       => 'main',
#     key         => '7F0CEB10',
#     key_server  => 'keyserver.ubuntu.com',
#     include_src => false
# }->
# exec { 'apt-get-update':  
#     command     => '/usr/bin/apt-get -y update',
#     refreshonly => true,
# }


# $packages = ["mongodb-org-server", "mongodb-org-client", "mongodb-org-tools", "mongodb-org-shell"]
# package {
#     $packages: ensure => "installed",
#     require     => Exec['apt-get-update']
# }
# include '::mongodb::server'
# include mongodb

# class {'::mongodb::server':
#     port => 27018,
#     auth => true,
# }


#->
#class {'::mongodb::client': }
# class {'::mongodb::db':
#     'testdb': {
#         user => 'user1',
#         password_hash => 'a15fbfca5e3a758be80ceaf42458bcd8',
#     }
# }

# mongodb::user {
#     "user1":
#         password => "pass1",
# }



# class {'::mongodb::globals':
#     manage_package_repo => true,
# }

# class {'::mongodb::server':
#   auth => true,
# }

# mongodb::db { 'testdb':
#   user          => 'user1',
#   password_hash => 'a15fbfca5e3a758be80ceaf42458bcd8',
# }


# class {'::mongodb::globals':
    # manage_package_repo => true,
    # version => "2.6.10",
    # server_package_name => "mongodb-10gen"
    #package_name => "mongodb-org-server",
# }



# class { '::mongodb::globals':
#   # manage_package_repo => true,
#   server_package_name => 'mongodb-org-server',
#   version => '2.6.10'
# }->
# exec { 'apt-get-update':  
#     command     => '/usr/bin/apt-get -y update',
#     refreshonly => true,
# }->
# class {'::mongodb::server': 
    # port => 27017,
    # auth => true,
    # bind_ip => ['0.0.0.0'],
# }
# mongodb_database { testdb:
#   ensure   => present,
#   tries    => 10,
#   # require  => Class['::mongodb::server'],
# }->


# mongodb_user { testuser:
#   name          => 'testuser',
#   ensure        => present,
#   password_hash => mongodb_password('testuser', 'p@ssw0rd'),
#   database      => admin,
#   roles         => ['readWrite', 'dbAdmin'],
#   tries         => 10,
#   require       => Class['::mongodb::server'],
# }

# mongodb_user { gemma:
#   name          => 'gemma',
#   ensure        => present,
#   password_hash => mongodb_password('gemma', 'mypassword'),
#   database      => admin,
#   roles         => ['root'],
#   tries         => 10,
#   require       => Class['::mongodb::server'],
# }

file { "/etc/mongod.conf":
    owner => root,
    group => root,
    mode => 644,
    source => "/vagrant/manifests/files/mongod.conf"
}->
apt::source { '10gen':
    location   => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart/',
    release     => 'dist',
    repos       => '10gen',
    key         => '7F0CEB10',
    key_server  => 'keyserver.ubuntu.com',
    include_src => false,
    # refreshonly => true 
}->
package {
    "mongodb-org": ensure => "2.6.10"
}->
service { "mongod":
  ensure => "running",
}

# class { '::mongodb::globals':
#   # manage_package_repo => true,
#   server_package_name => 'mongodb-org-server',
#   version => '2.6.10'
# }->
# mongodb_user { gemma:
#   name          => 'gemma',
#   ensure        => present,
#   password_hash => mongodb_password('gemma', 'mypassword'),
#   database      => admin,
#   roles         => ['root'],
#   tries         => 10,
#   # require       => Class['::mongodb::server'],
# }->
# class {'::mongodb::server': 
#     port => 27017,
#     auth => true,
#     bind_ip => ['0.0.0.0'],
# }

