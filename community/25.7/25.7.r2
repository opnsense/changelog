@ Juli 17, 2025

How are you doing?

This is the second release candidate for your consideration.  A kernel update
was included to keep up with FreeBSD stable/14.  A few nice things have
been added to Dnsmasq as well.  This is an online update only.

Here are the development highlights since version 25.1 came out:

o Replace the setup wizard with a modern MVC/API variant
o Switch to reusable frontend code
o ChartJS 4 update and related functionality migrations
o User manager CSV export and import option
o New plugin for SFTP configuration backups
o Move frontend grid from Bootgrid to Tabulator
o Optional privilege separation for the web GUI (running as non-root)
o User/group manager adds optional source network constraint
o JSON container support for aliases
o Firewall automation GUI revamp
o Performance improvements when using large amounts of aliases
o Dnsmasq DHCP support for small and medium sized setups
o Support advanced (manual) configurations in Kea
o Add IPv6 support (including prefix delegation) to Kea
o Bridges MVC migration
o Migrate IPsec mobile page to MVC
o Greek as a new language
o FreeBSD 14.3

And these are the full patch notes against 25.7-RC1:

o system: fix passing "arguments" as parameters for cron jobs
o firewall: code cleanup and performance improvements for alias diagnostics page
o dnsmasq: add CNAME configuration option to host overrides
o dnsmasq: add optional subnet mask to "dhcp-range" to satisfy DHCP relay requirements
o dnsmasq: fix empty DHCP option value spawning stray comma
o lang: make more strings translate-able (contributed by Tobias Degen)
o lang: further updates
o isc-dhcp: add static mapping CSV export
o backend: trigger boot template reload without using configd
o mvc: use getNodeContent to gather grid data
o ui: adjusted grid command column sizes appropriately where needed
o ui: exclude container fields from search functionality for now
o src: bnxt: fix BASE-T, 40G AOC, 1G-CX, autoneg and unknown media lists
o src: net80211: in ieee80211_sta_join() only do_ht if HT is avail
o src: linuxkpi: assorted changes from stable/14
o src: iwlwifi: compile in ACPI support
o src: rtw89: enable ACPI support on FreeBSD
o src: ifconfig: optimise non-listing case with netlink
o src: pf: fix ICMP ECHO handling of ID conflicts

Migration notes, known issues and limitations:

o Deprecated Google Drive backups due to upstream policy changes and moved to plugins for existing users.
o API URLs registered in the default ACLs have been switched from "camleCase" to "snake_case".
o API grid return values now offer "%field" for a value description when available. "field" will now always be the literal value from the configuration. The API previously returned a display value for some field types, but not all.
o Reverted tunables "hw.ibrs_disable" and "vm.pmap.pti" to FreeBSD defaults.
o The new wizard still has bugs relating to disabling LAN configuration.
o Moved OpenVPN legacy to plugins as a first step to deprecation.
o Moved IPsec legacy to plugins as a first step to deprecation.


Stay safe,
Your OPNsense team
