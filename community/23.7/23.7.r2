@ July 24, 2023

Hi!

Quick release candidate update.  May or may not be the last one this
week depending on the feedback we will receive.  So far thanks to all
the brave testers!

Still on track for the final release on July 31.

Here are the full patch notes:

o system: mute openssl errors pushed to stderr
o system: add opnsense-crypt utility to encrypt/decrypt a config.xml
o system: call opnsense-crypt from opnsense-import to deal with encrypted imports
o interfaces: rewrite LAGG pages via MVC/API
o interfaces: allow manual protocol selection for VLANs
o interfaces: remove null_service toggle as empty service name in PPPoE works fine
o monit: fix alert script includes
o ipsec: add passthrough networks when specified to prevent overlapping "connections" missing them
o unbound: fix upgrade migration when database is not enabled
o unbound: minor endpoint cleanups for DNS reporting page
o firmware: fix a faulty JSON construction during partial upgrade check
o ports: openssh 9.3p2[1]


Stay safe,
Your OPNsense team

--
[1] OPENSSH:9.3p2
