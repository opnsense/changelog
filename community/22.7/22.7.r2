@ July 20, 2022

Hello there,

Quick update on the release candidate series with assorted improvements.

All relevant tickets have been closed and roadmap items completed.
There are no visible blockers for 22.7 next week at the moment so we
will still be targeting July 28 as the release date.

Here are the full patch notes:

o system: apply default firewall policy before interface configuration
o system: move remote backup script to proper file system location
o system: remove support for displaying legacy logs in the GUI
o system: disable flag was not removing static route
o system: Net_IPv6::compress() should not compress "::" to ""
o system: fix RADIUS config validation for port requirement (contributed by Josh Soref)
o interfaces: disable IPv6 inside 4in6 and 4in4 GIF tunnels (contributed by Maurice Walker)
o interfaces: ping diagnostics tool must explicitly set IP version (contributed by Maurice Walker)
o interfaces: remove other inconsistencies regarding ping utility changes in FreeBSD 13
o interfaces: correct regex validation for dhcp6c expire statement (contributed by Josh Soref)
o interfaces: add missing scope to link-local GIF host route
o dhcp: remove print_content_box() use
o dnsmasq: switch to a Python-based DHCP lease watcher
o firmware: limit changelog-based update check on dashboard to release version
o firmware: provide an upgrade log audit
o intrusion detection: remove dead link to McAfee rule references
o unbound: prevent crash of DHCP lease watcher due to unhandled CalledProcessError exception
o mvc: fix two regressions in BaseField for Phalcon 5
o mvc: store configuration changes only when actual changes exist
o ui: fix assorted typos in the code base (contributed by Josh Soref)
o ui: handle HTTP 500 error gracefully in MVC pages


Stay safe,
Your OPNsense team
