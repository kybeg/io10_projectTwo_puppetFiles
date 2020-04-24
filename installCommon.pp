$people = ['brady', 'janet', 'tom' ]
$groups = [ 'admin','sudo' ]

# must be run with the future parser: puppet apply --parser future --noop common.pp
each($people) |$user| {
        user { "$user":
                ensure => present,
                password => '',
                shell => '/bin/bash',
                home => "/home/$user",
                require => File["/home/$user"],
                groups => $groups,
        }
        file { "/home/$user":
                ensure => directory
        }
}

group { 'admin' :
        ensure => present,
        gid => 501,
}
