#!/bin/sh

# enable the serial console
if [ -f /bin/systemctl ]
then
	/bin/systemctl enable serial-getty@ttyS0.service
elif [ -f /etc/inittab ]
then
	/bin/sed -i 's/#T0:23:respawn:\/sbin\/getty -L ttyS0 9600 vt100/T0:23:respawn:\/sbin\/getty -L ttyS0 115200 vt100/' /etc/inittab
fi

# disable puppet
if [ -f /etc/systemd/system/multi-user.target.wants/puppet.service ]
then
	/bin/systemctl disable puppet.service
fi
