class files {
  file {'/etc/hosts':
    ensure	=> present,
    owner	=> root,
    group	=> root,
    mode	=> '0644',
    content	=> "127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
127.0.1.1       raspberrypi
127.0.0.1       puppet"
  }


  file {'/etc/rc.local':
    ensure	=> present,
    owner	=> root,
    group	=> root,
    mode	=> '0755',
    content	=> "#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will exit 0 on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

sudo iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE

sleep 30
/usr/local/bin/noip2

pon awsvpn

sleep 30
/root/addroutes.sh

exit 0"
  }
}
