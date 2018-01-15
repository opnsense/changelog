@ January 15, 2018

Hello everyone,

Long story short: we thank all early testers of 18.1-RC1!  You guys
have made it possible to push this online update of 18.1-RC2 sooner
than anticipated.

Here are the full patch notes:

o system: add workaround for new 32 bit mmap disallow default (requires reboot)
o system: modify the boot sequence to improve initial IP assignment for PPPoE
o system: support additional RADIUS attributes and show them in the authentication tester
o system: only zap non-directories in /var/run on boot
o system: remove mocked version string in high availability synchronisation
o system: added mail facility remote logging
o firewall: optional hash identifier for rules makes them easier to find in system file
o firewall: support IPv4 + IPv6 selection for port forwards
o firewall: add VIP gateway option for PPPoE interfaces
o firewall: rename NPT to NPTv6 for clarity
o firewall: race condition in creating alias directory
o firewall: make NAT reflection enable less ambiguous
o interfaces: fix "route change" usage in PPPoE name server setup
o dhcp: properly route assigned IPv6 prefixes
o firmware: new release type version is unknown when updates have never been checked
o firmware: security audit previously said "upgrade done"
o firmware: remove defunct mirrors
o installer: allow to overwrite /boot even on read-only media
o installer: restore DUID if found during early import
o intrusion detection: fix backend scripts after refactor
o openssh: tweak GUI display of greeting message
o openssh: make not permitting root login explicit
o openvpn: revert a change and fix deprecated option
o web proxy: allow SSL nobump via CN
o ui: HTML compliance fixes obsolete table attributes (contributed by NOYB)
o ui: HTML compliance fixes attribute "type" on i-tag (contributed by NOYB)
o ui: HTML compliance fixes attribute "for" on div-tag (contributed by NOYB)
o ui: HTML compliance for license page and dashboard widgets (contributed by NOYB)
o mvc: new validators for host names
o plugins: pass update type on configure to avoid spurious syslog reloads
o plugins: acme-client 1.13[1] (contributed by Frank Wall)
o plugins: c-icap 1.5 fixes startup race with clamav plugin
o plugins: frr 1.0_1 fixes service probing
o plugins: iperf 1.0 (contributed by Fabian Franz)
o plugins: lldp 1.0 (contributed by Michael Muenz)
o plugins: redis 1.0 (contributed by Fabian Franz)

The list of currently known issues with 18.1-RC1:

o The firewall NAT rule generation rewrite is not yet fully verified.
o The web GUI recovery is not yet fully implemented.


Stay safe,
Your OPNsense team

--
[1] https://github.com/opnsense/plugins/pull/482
