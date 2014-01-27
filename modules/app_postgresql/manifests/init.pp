class app_postgresql {
  
  class { 'postgresql::server':

      ip_mask_allow_all_users    => '0.0.0.0/0',
      listen_addresses           => '*',
      manage_firewall => true,
      postgres_password          => 'postgres',
      ip_mask_deny_postgres_user => '192.169.9.999'

  }
  postgresql::server::db { 'sobrinatungdotcom':
    user     => 'pies',
    password => postgresql_password('pies', 'pies84'),
  }
  postgresql::server::db { 'sobrinatungdotcom-dev':
    user     => 'pies',
    password => postgresql_password('pies', 'pies84'),
  }
  postgresql::server::db { 'sobrinatungdotcom-test':
    user     => 'pies',
    password => postgresql_password('pies', 'pies84'),
  }


  
}
