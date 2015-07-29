# include '::rabbitmq'
# include epel
# include staging
# class { 'erlang': epel_enable => true}

include '::service:upstart'

class { 'rabbitmq':
    port                    => '5672',
    service_manage          => true,
    delete_guest_user => true,
    # environment_variables   => {
    #     'RABBITMQ_NODENAME'     => 'server',
    #     'RABBITMQ_SERVICENAME'  => 'rabbitMQ'
    # }
}

include '::mongodb::server'

# class {'::mongodb::server':
#     # port    => 27018,
#     # auth => true,
# }

# mongodb::db { 'testdb':
#   user          => 'user1',
#   password_hash => '',
# }