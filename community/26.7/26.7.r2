@ July 09, 2026

What is up everyone,

Summer challenges aside: 26.7 is almost here!  It includes FreeBSD 15.1
and a somewhat small list of other highlights.  The reason for that is
a stringent backporting strategy that was employed in the 26.1 series.

Keep in mind this is an online-based pre-production test release.
Upgrades from the 26.1.11 development version are already available.
The final release date for 26.7 is July 15.

Here are the development highlights since version 26.1 came out:

o Interfaces assignments to MVC/API
o Gateway groups to MVC/API
o Firewall rules MVC page is now the default
o Source NAT is now a replacement for outbound NAT
o Captive portal IPv6 support
o Kea DDNS, custom options and dynamic prefix delegation support
o OpenVPN 2.7 with TLS-Crypt v2 support
o FreeBSD 15.1
o Python 3.13
o PHP 8.5

And these are the changes against version 26.7-RC1:

o system: include interfaces widget in dashboard default
o firewall: constraint source NAT getAction() to only general page and align setAction() accordingly
o firewall: use proper path for one-to-one NAT rules for renaming operations
o firewall: avoid emitting reply-to on block rules as well
o captive portal: adjust accounting interval to Acct-Interim-Interval
o firmware: remove overzealous cleansing in output_cmd to unhide individual character progress
o monit: fix mail-format and poll-time validation
o mvc: add file type to forms
o ports: suricata 8.0.6[1]

A hotfix release was issued as 26.7.r2_3:

o interfaces: fix faulty netmask on loopback address due to upstream change
o firewall: change interface group render/apply order
o backend: swap "strict" template logic as it was reversed
o src: pf: do not mangle IP header before shared forwarding
o src: additional stable/15 networking patches


Stay safe,
Your OPNsense team

--
[1] https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391
