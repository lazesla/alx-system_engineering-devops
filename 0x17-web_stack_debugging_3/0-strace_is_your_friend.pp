# Attach strace to the Apache process with PID
sudo strace -p <apache_pid> -o apache_strace.log
curl -sI 127.0.0.1

# content of 0-strace_is_your_friend.pp
file { '/etc/apache2/sites-available/your-site.conf':
  ensure  => file,
  source  => 'puppet:///modules/your_module/your-site.conf', # Upload your fixed site configuration file to this path on the Puppet server
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  require => Package['apache2'],
  notify  => Service['apache2'],
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => File['/etc/apache2/sites-available/your-site.conf'],
}
