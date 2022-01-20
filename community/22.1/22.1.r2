@ January 20, 2022

Hi there,

Quick update on the 22.1 front includes feedback from the RC1 release,
a FreeBSD package tool fix for its static binary failing to validate
certain TLS certificates and a number of small improvements that do not
fit into the former categories.

The 22.1 release is scheduled for January 27 which is next week already.  ;)

Here are the full patch notes:

o system: use correct IPv6 interface for dpinger gateway monitoring when using 6RD
o system: remove spurious XML validation that cannot cope with attributes from backup restore
o system: sync recovery utility contents with FreeBSD 13
o system: fix new PPP CARP hook function call (contributed by Markus Reiter)
o system: allow additional search domain (Pierre Fevre)
o system: fix general settings PHP warnings that only appear when validation fails
o system: move multiple sysctl manipulations to tunables framework to allow overriding them
o system: prevent more than one default route by default
o system: prevent syslog-ng from crashing after update due to "syslog-ng-ctl reload" use
o system: MSDOS file system awareness in information widget for new /boot/efi partition
o system: separate core and thread count in information widget
o system: refactor GUI rebind protection and remove its os-dyndns/os-rfc2136 references
o reporting: fix display of total in/out traffic values
o interfaces: improve validations and fix defaults for bridges
o interfaces: remove defunct link support for GRE
o interfaces: align GIF configuration with base system options
o interfaces: allow bridges to attach to VXLAN on boot
o interfaces: repair get_interface_list() for console use
o interfaces: improve LAGG/VLAN assignments via console option
o firewall: live log default logging severity selection is now "informational"
o firewall: improve maximum shaper value validation and add Gbit/s support
o dhcp: rework router advertisement "static" mode flags to separate advanced options
o dnsmasq: no-hosts option (contributed by agh1467)
o firmware: opnsense-update: exclude /boot/efi permission reset from base set extract
o intrusion detection: prevent config migration from crashing
o intrusion detection: update to ET-Open to version 6
o network time: detach "limited" from "kod" option (contributed by Zsolt Zsiros)
o network time: remove PID file use as it can be unreliable
o mvc: fix logging of configd errors
o mvc: Add BlankDesc to ModelRelationField (contributed by agh1467)
o ui: move storing jQuery Bootgrid settings in browser from core to bootgrid (contributed by Manuel Faux)
o plugins: os-ddclient 1.0 as an eventual replacement for os-dyndns
o plugins: os-dyndns adds local copy of get_dyndns_ip()
o plugins: os-freeradius 1.9.18[1]
o plugins: os-nginx 1.26[2]
o plugins: os-rfc2136 adds local copy of get_dyndns_ip()
o plugins: os-wol adds cron support for wake action (contributed by digitalshow)
o src: revert upstream permission change for /root directory
o src: fix kernel build creating wrong linkers.hint file
o ports: hostapd 2.10[3]
o ports: nss 3.74[4]
o ports: pecl-psr 1.2.0[5]
o ports: pkg fixes validation failures on HTTPS fetch in static binary[6]
o ports: sqlite 3.37.2[7]
o ports: syslog-ng 3.35.1[8]
o ports: wpa_supplicant 2.10[9]


Stay safe,
Your OPNsense team

--
[1] PLUGINS:22.1/net/freeradius
[2] PLUGINS:22.1/www/nginx
[3] https://w1.fi/cgit/hostap/plain/hostapd/ChangeLog
[4] NSS:3.74
[5] https://pecl.php.net/package-changelog.php?package=psr&release=1.2.0
[6] https://cgit.freebsd.org/ports/commit/?id=08342c9812d
[7] SQLITE:3.37.2
[8] SYSLOG-NG:3.35.1
[9] https://w1.fi/cgit/hostap/plain/wpa_supplicant/ChangeLog
