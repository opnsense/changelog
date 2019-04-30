@ July 21, 2017

Hello, hello!

For more than two and a half years now, OPNsense is driving innovation
through modularising and hardening the open source firewall, with simple
and reliable firmware upgrades, multi-language support, HardenedBSD
security, fast adoption of upstream software updates as well as clear
and stable 2-Clause BSD licensing.

We are writing to you today to announce the second release candidate for
version 17.7, which, over the course of the last 5 months, includes
highlights such as SafeStack application hardening, the Realtek re(4)
driver for network stability, a Quagga plugin with broad routing protocol
support and the Unbound resolver as the new default.  Additionally,
translations for Czech, Chinese, Japanese, Portuguese and German have
been completed during this iteration.

Focus in OPNsense has shifted to improving and streamlining its various
systems and providing continuous updates, which amounts to over 300
individual changes made since 17.1 so far.  The plugin infrastructure is
growing as well thanks to our awesome contributors Frank Wall, Frank
Brendel, Fabian Franz and Michael Muenz.  And we, last but not least,
have been working more closely than ever with HardenedBSD by unifying
our ports infrastructure.  Although this is only the beginning, let us
not skip ahead.

Here is the full list of changes against version 17.7-RC1:

o system: harden GUI by removing TLS_RSA_WITH_3DES_EDE_CBC_SHA
o system: harden GUI by improving Secure Attribute cookie usage
o system: harden GUI by using DH-4096 parameters
o system: regenerate Diffie-Hellman parameters
o system: allow to reverse password / token order in TOTP authentication
o system: added major GUI firmware upgrade code
o interfaces: fix WLAN device clone creation
o interfaces: improve LAGG MTU handling and reconfigure
o interfaces: Host-Uniq configuration option for PPPoE connections
o ipsec: IKEv2 can handle multiple phase 1 with the same IP
o installer: request password change after installation
o installer: now properly advertises itself as version 17.7
o rc: batch-run bootup command before starting services
o openvpn: normalise line endings like web GUI does
o openvpn: fix config read/write on PHP 7.1
o mvc: squelch a PHP notice on an undefined element in forms (contributed by Evgeny Bevz)
o lang: update Chinese, Czech, German, Japanese
o plugins: enable stable plugins for 17.7
o plugins: os-dyndns 1.1 fixes menu entry visibility
o plugins: os-quagga 1.3.2 (contributed by Fabian Franz and Michael Muenz)
o ports: php 7.0.21[1]
o ports: perl 5.24.2[2]
o ports: suricata 3.2.3[3]
o ports: unbound 1.6.4[4]

The list of currently known issues with 17.7-RC2:

o LAGG device destroy may cause a kernel panic.  A fix is scheduled for 17.7.
o IPsec inbound packet filtering does not work under NAT-T.  A fix is scheduled for 17.7.
o PPPoE Host-Uniq is still in the test phase and may not be fully operational.
o Configuration handling of static PHP is not always compatible with PHP 7.1 at this point.  We are downgrading to 7.0 for the release of 17.7 to ensure integrity.

Users of 17.7-RC1 can upgrade to RC2 via the usual online updates.  Images
are not provided with this particular release.  As always with our pre-
releases, only OpenSSL is provided at this point, but can be switched for
LibreSSL as soon as the release is available.  This release candidate does
update directly into the 17.7 stable track and subsequent release candidates.
Please let us know about your experience!


Stay safe,
Your OPNsense team

--
[1] https://php.net/ChangeLog-7.php#7.0.21
[2] http://search.cpan.org/dist/perl-5.24.2/pod/perldelta.pod
[3] https://suricata-ids.org/2017/07/13/suricata-3-2-3-available/
[4] http://www.unbound.net/download.html
