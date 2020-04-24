class { '::mysql::server':
  root_password    => 'newPassword',
  override_options => {
    mysqld         => {
      log-bin      => '/var/log/mysql/mysql-bin.log',
      server_id    => 0
    }
  },
}
