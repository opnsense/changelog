@ July 19, 2018

What up!

So far so good. Here is another batch of changes for the upcoming 18.7
release from assorted areas. Also included is the latest Suricata 4.0.5.

We have bundled the firewall alias API progress under the hood, but
it looks like we will miss our initial 18.7 target.  Sorry about that.
Though it should be worth the wait.  :)

Here is the full list of changes:

o system: show fingerprint in certificate details (contributed by Robin Schneider)
o system: fix NextCloud file name format (contributed by Fabian Franz)
o system: allow remote backup via cron command
o system: clarify interface labels for NetFlow generator
o system: restart syslog when interface bind addresses may have changed
o system: do not use forced down gateways for default gateway switching
o system: allow USB-based serial ports
o interfaces: allow /0 to /32 in 6rd and align prefix length calculation with effective prefix used
o interfaces: 6rd validation and avoid listing on assignment page
o firewall: remove virtual IP network address restrictions for IPv6
o firewall: ignore namelookup when no nameservers are configured
o firewall: drop detail description field in preparation for alias API
o firewall: do not emit reflection rules for the wrong address family
o firewall: properly handle 6rd / 6to4 tunnel device in rule generation
o firewall: allow to select external aliases
o dashboard: add a 6 widget columns option
o firmware: slightly improve remote probing of kernel and base set
o firmware: hide upgrade banner when update is done
o installer: give basic tip that GUI IP can be set in console (contributed by stilez)
o intrusion detection: clean up previously installed rules
o ipsec: add mutual RSA and EAP-MSCHAPv2 support
o monit: fix UI issues (contributed by Frank Brendel)
o ntp: typo in SiRF selection
o openvpn: change IP calculation of /31 tunnel networks (contributed by Daniil Baturin)
o openvpn: move generation of client connect / disconnect directives to server mode block
o openvpn: properly translate several validation messages
o openvpn: disable use of /32 tunnel networks
o shell: show SSH and HTTPS fingerprints in banner (contributed by Robin Schneider)
o shell: reset DHCPv6 configuration during port reconfigure
o shell: clarify install media login message (contributed by stilez)
o shell: move banner display to top
o unbound: add latest root hints to standard configuration
o web proxy: allow to not use request or response URL in ICAP
o mvc: multiselect may allow empty option, no need to give blank item too
o plugins: os-frr 1.4 cleans up redistribute options (contributed by ShaRose)
o plugins: os-zabbix-proxy 1.1 adds PSK-based encryption (contributed by fzoske)
o plugins: os-theme-cicada 1.2 (contributed by Team Rebellion)
o plugins: os-theme-rebellion 1.2 (contributed by Team Rebellion)
o plugins: os-theme-tukan 1.1 (contributed by Team Rebellion)
o plugins: os-openconnect 1.1 (contributed by Michael Muenz)
o plugins: os-net-snmp 1.0 fix for listening field (contributed by Michael Muenz)
o plugins: os-haproxy 2.7 restores multiselect where needed (contributed by Frank Wall)
o plugins: os-web-proxy-sso 2.2 UI fixes (contributed by Smart-Soft)
o ports: dhcp6c now supports raw option send and receive (contributed by Team Rebellion and Christoph Engelbert)
o ports: suricata 4.0.5[1]

As always with our pre-releases, only OpenSSL is provided at this point,
but can be switched for LibreSSL as soon as the release is available.
This release candidate does update directly into the 18.7 stable track
and subsequent release candidates.  Please let us know about your experience!


Stay safe,
Your OPNsense team

--
[1] https://suricata-ids.org/2018/07/18/suricata-4-0-5-available/
