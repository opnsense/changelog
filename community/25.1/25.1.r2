@ January 24, 2025

What up!

Just a small update to ship the latest changes and fixes.  The anti-lockout
not working was finally addressed.  Thanks for all the valuable feedback on
the forum!

Here are the full patch notes against version 25.1-RC1:

o system: prioritize index page and prevent redirection to a /api page on login
o system: mute disk space status in case of live install media
o system: optimize system status collection
o firewall: add experimental inline shaper support to filter rules
o firewall: add missing columns on one-to-one NAT page
o firewall: fix unassociated rule creation
o firewall: fix anti-lockout and "allow access to DHCP failover" automatic rules
o firewall: add optional authorization for URL type aliases
o installer: fixed missing prompt and help text in ZFS disk selection
o installer: warn on low RAM for ZFS as well
o installer: added a power off option
o intrusion detection: policy content dropdown missing data-container
o intrusion detection: cleanse metadata for brackets
o ipsec: add banner message when using custom configuration files
o monit: flag file overwrites when they exist
o openvpn: add validation pertaining to auth-gen-token and reneg-sec combinations
o unbound: cleanup available blocklists and add hagezi blocklists
o unbound: flag file overwrites when they exist
o mvc: fix NetworkValidator for IPv4-mapped addresses with netmask (contributed by John Fieber)
o plugins: turning binary data into JSON may fail globally
o plugins: os-caddy 1.8.1[1]


Stay safe,
Your OPNsense team

--
[1] PLUGINS:25.1/www/caddy
