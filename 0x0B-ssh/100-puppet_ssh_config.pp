# Puppet manifest that changes the config file for ssh
include stdlib
file_line { 'Turn-off-passwd-auth':
ensure  => 'present',
path    => '/etc/ssh/ssh_config',
line 	=> 'PasswordAuthentication no',
match	=> 'PasswordAuthentication yes'
}

file_line { 'Declare-identity-file':
ensure  => 'present',
path    => '/etc/ssh/ssh_config',
line 	=> 'IdentityFile ~/.ssh/school',
match	=> 'IdentityFile ~/.ssh/id_rsa'
}
