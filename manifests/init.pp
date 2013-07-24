class overcommit($ensure=present) {

  file { '/etc/sysctl.d/overcommit.conf':
    ensure  => $ensure,
    content => "vm.overcommit_memory=1"
  }

  if $ensure == 'present' {
    exec { 'overcommit-memory':
      command => "/sbin/sysctl vm.overcommit_memory=1",
      unless  => "/usr/bin/test `/sbin/sysctl -n vm.overcommit_memory` = 1"
    }
  }
}

