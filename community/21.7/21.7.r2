@ July 14, 2021

Hi there,

For more than 6 and a half years, OPNsense is driving innovation through
modularising and hardening the open source firewall, with simple and reliable
firmware upgrades, multi-language support, fast adoption of upstream software
updates as well as clear and stable 2-Clause BSD licensing.

We thank all of you for helping test, shape and contribute to the project!
We know it would not be the same without you.  <3

Here are the full patch notes:

o system: prevent use of client certificates in web GUI
o system: lock config writes during HA merges
o system: hide far gateway option for IPv6
o system: isvalidpid() is not required for a single killbypid()
o system: fix PHP 7.4 deprecated warning in IPv6 library
o system: do not split XMLRPC password into multiple pieces
o system: enable group sync for LDAP servers that do not return memberOf (contributed by rdd2)
o interfaces: deprecate SLAAC addresses on linkdown
o firewall: possibility to filter nat/rdr action in live log
o firewall: use permanent promiscuous mode for pflog0
o dhcp: assorted improvements surrounding dhcpd_staticmap() for real world operation
o firmware: static template for firmware upgrade message
o installer: assorted wording improvements
o shell: fix IPv4 /31 assignment
o unbound: add "unbound check" backend action
o unbound: allow to retain cache on service reload
o unbound: fix /var MFS dilemma for DNSBL after boot
o unbound: remove deprecated custom options setting
o rc: opnsense-beep melody database directory
o plugins: os-acme-client 2.6[1]
o plugins: os-freeradius 1.9.15[2]
o plugins: os-haproxy 3.4[3]
o plugins: os-nextcloud-backup 1.0
o plugins: os-nginx Phalcon 4 fixes
o plugins: os-radsecproxy 1.0 (contributed by Tobias Boehnert)
o plugins: os-tor Phalcon 4 fix
o plugins: os-zabbix-agent 1.9[4]
o src: separately log NAT and firewall rules in pf(4)
o src: libcasper: fix descriptors numbers[5]
o src: linux: prevent integer overflow in futex_requeue[6]
o ports: clog 1.0.2 fixes garbage header write on init
o ports: php 7.4.21[7]
o ports: suricata 5.0.7[8]

Known issues and limitations:

o NextCloud backup feature moved from core to plugins.  Please reinstall if needed.
o IPsec identities are now set using their explicit type.  See StrongSwan documentation[9] for the old automatic defaults.
o Unbound custom options setting has been discontinued.  Local override directory /usr/local/etc/unbound.opnsense.d exists.

Please let us know about your experience!


Stay safe,
Your OPNsense team

--
[1] PLUGINS:21.7/security/acme-client
[2] PLUGINS:21.7/net/freeradius
[3] PLUGINS:21.7/net/haproxy
[4] PLUGINS:21.7/net-mgmt/zabbix-agent
[5] FREEBSD:EN-21:19.libcasper
[6] FREEBSD:EN-21:22.linux_futex
[7] PHP7:7.4.21
[8] https://redmine.openinfosecfoundation.org/versions/166
[9] https://wiki.strongswan.org/projects/strongswan/wiki/IdentityParsing
