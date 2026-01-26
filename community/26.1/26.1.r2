@ January 26, 2026

Good morning again,

The second release candidate for 26.1 brings fixes for issues found by
our awesome community.  As an online-only update you need 26.1-RC1 to
install it.

The long-awaited dhcp6c refresh has been included as well as the latest
version for hostwatch addressing the community concerns collected from
25.7.11.

Here are the changes against version 26.1-RC1:

o system: add XMLRPC option for hostwatch
o interfaces: show ISC-DHCPv6 menu in "idassoc6" mode
o interfaces: fix validation issue in "idassoc6" mode
o interfaces: handle hostwatch user/group via package
o interfaces: avoid forced reloads when PDINFO is not set
o firewall: fix 3 issues and improve instructions in rule migration page
o firewall: improve GeoIP alias expiry condition
o firewall: escape selector in rule_protocol
o kea: add libdhcp_host_cmds.so to expose internal API commands for reservations
o kea: allow "hw-address" for reservations
o kea: add pool in subnet validation
o openvpn: account for CARP status in start and restart cases as well
o radvd: remove faulty empty address exception
o lang: various translation updates
o mvc: add ChangeCase support to ProtocolField for DNAT special case
o ports: dhcp6c v20260122
o ports: hostwatch 1.0.9

A hotfix release was issued as 26.1.r2_2:

o interfaces: if no idassoc6/track6 LAN is used also emit a PD request like before
o firewall: make previously associated DNAT rules editable

Migration notes, known issues and limitations:

o ISC-DHCP moves to a plugin. It will be automatically installed during upgrades. It is not installed on new installations because it is not being used, but you can still install and keep using it.
o To accomodate the change away from ISC-DCHP defaults the "Track interface" IPv6 mode now has a sibling called "Identity Association" which does the same except it is not automatically starting ISC-DHCPv6 and Radvd router advertisements to allow better interoperability with Kea and Dnsmasq setups.
o Due to command line execution safety concerns the historic functions mwexec_bg() and mwexec() will be removed in 26.1.x.  Make sure your custom code is not using them and use mwexecf(), mwexecfb() and mwexecfm() instead.
o The function sessionClose() has also been removed from the MVC code and is no longer needed.  Make sure to remove it from your custom code.
o The custom.yaml support has been removed from intrusion detection.  Please migrate to the newer /usr/local/etc/suricata/conf.d override directory.
o The new host discovery service "hostwatch" is enabled by default (since 25.7.11).  You can always turn it off under Interfaces: Neighbors: Automatic Discovery if you so choose.
o The firewall migration page is not something you need to jump into right away.  Please make yourself familiar with the new rules GUI first and check the documentation for incompatibilities.
o Firewall: NAT: Port Forwarding is now called "Destination NAT".  Firewall rule associations are no longer supported, but the old associated firewall rules remain in place with their last known configuration and can now be edited to suit future needs.

Please let us know about your experience!


Stay safe,
Your OPNsense team
