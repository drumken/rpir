class files {
  file {'/etc/hosts':
    ensure	=> present,
    owner	=> root,
    group	=> root,
    mode	=> '0644',
    content	=> " 127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
127.0.1.1       raspberrypi
127.0.0.1       puppet"
  }
}
