openvpn:
	apt-get install openvpn -y
	curl https://gist.githubusercontent.com/sbma44/229deadcc848e9e06399/raw/7e8ff328dedfbe9d1b40895ffd8ebc67e6f82a94/gistfile1.txt -o /etc/openvpn/IPredator-CLI-Password.conf
	echo "USERNAME" | tee -a /etc/openvpn/IPredator.auth
	echo "PASSWORD" | tee -a /etc/openvpn/IPredator.auth

mediatomb:
	apt-get install mediatomb -y
	curl https://gist.githubusercontent.com/sbma44/51e2a7ade75dfa15b3fa/raw/5b0f549da4858d8a19769cba4fd0e5ea8c101d8c/gistfile1.txt -o /etc/mediatomb/config.xml

deluge:
	apt-get install deluge deluge-daemon deluge-web deluge-console -y
	adduser deluge deluge
	curl https://gist.githubusercontent.com/sbma44/f9cebc9f1dd17536b331/raw/5d68931ad494962cc4ee0a67f6699427450c5c3f/gistfile1.txt -o /etc/init.d/deluge-daemon
	curl https://gist.githubusercontent.com/sbma44/1937d1ac6cf6ff912afb/raw/e6e05ab4aedfeee6b9c4317075020e4174e6e6ee/gistfile1.txt -o /home/deluge/.config/deluge/core.conf
	curl https://gist.githubusercontent.com/sbma44/3eaf26a2f2be30ab20af/raw/568254b83ad7ab16823f324a69f1613fff698b3a/gistfile1.txt -o /home/deluge/.config/deluge/execute.conf
	curl https://gist.githubusercontent.com/sbma44/7c29f9e751f804d4f155/raw/3946deed79b5f38bd6060346295785ec989657c4/gistfile1.txt -o /usr/bin/deluge-push-notification
	update-rc.d deluge-daemon defaults

usb:
	#echo "" | tee -a /etc/fstab
	mount -a
	mkdir -p /mnt/usb/torrents/complete /mnt/usb/torrents/down /mnt/usb/torrents/watch
	

bone.img:
	curl http://debian.beagleboard.org/images/bone-debian-7.5-2014-05-14-2gb.img.xz -o bone.img.xz
	xz -d bone.img.xz
	touch bone.img

flash:	
	dd if=bone.img | pv -peta -s1700m | dd bs=1000000 of=$(TARGET)

all:
	usb
	openvpn
	mediatomb
	deluge