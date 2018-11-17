class packages {
  package {'iftop':
    ensure => present,
  }
  package {'htop':
    ensure => present,
  }
  package {'atop':
    ensure => present,
  }
}
