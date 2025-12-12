@ December 16, 2016

Dear friends and followers,

With the best wishes for the holiday season attached we hereby humbly
present our 17.1-BETA images and thank everyone for their early input,
valid questions and generally keeping us on our toes throughout the
past months.  The next major release features FreeBSD 11.0, the SSH
remote installer, new languages Italian and Czech, state-of-the-art
HardenedBSD security features, PHP 7.0, native PAM authentication
against e.g. 2FA (TOTP), as well a rewritten Nano-style card images
that adapt to the media size to name only a few.

These will be the only beta images.  They are not suitable for production
environments.  Release candidate builds will start in January in order
to provide production-ready images.  Checksums can be found below this
announcement.  Direct download links from our capable mirror providers
are as follows:

https://opnsense.c0urier.net/releases/17.1.b/ (Europe)
http://mirrors.nycbug.org/pub/opnsense/releases/17.1.b/ (US East Coast)
http://mirror.sfo12.us.leaseweb.net/opnsense/releases/17.1.b/ (US West Coast)

https://opnsense.org/download/ (full mirror list)

Here is a list of hand-picked major features that were worked on since 16.7:

o system secondary console support with new EFI and Mute options
o installer now boots up with SSH for headless remote installation
o Italian as a release language (contributed by Antonio Prado)
o Czech as a release language (contributed by Pavel Borecki)
o HardenedBSD ASLR and PIE compilation for most binaries
o HardenedBSD SEGVGUARD to prevent ASLR brute force attacks
o PHP 7.0 compatibility and general GUI speed improvements
o improved password security (contributed by OSnet)
o FTP proxy plugin (contributed by Frank Brendel)
o PAM authentication module, e.g. 2FA on SSH
o IPsec tunnel isolation mode for interoperability
o Intel em(4) driver version 7.6.2 as a plugin
o micro versioning/migrations for config items
o constraint support for config items
o rewritten Nano images with growfs(8) support
o authentication methods are now fully pluggable
o firewall rules are now fully pluggable
o Tinc VPN Plugin
o FreeBSD 11.0

Known issues in this version:

o The inherited 6rd kernel patches are not included in standard FreeBSD 11.0.  The impact on 6rd setups is currently unknown.
o The installer character set is not entirely correct due to the default console switch to vt(4).
o Fundamental WiFi stack changes in FreeBDS 11.0 may still affect overall operability.
o Insight and Health statistics import from the early installer do not work.
o The LibreSSL version will not be available until the final release.

Any help in making 17.1 the best it could possibly be for its final
release at the end of January 2017 is highly appreciated.  Please do
not hesitate to contact us through any of the known channels:

o Twitter: https://twitter.com/opnsense
o Forum: https://forum.opnsense.org/
o GitHub: https://github.com/opnsense


Stay safe and merry,
Ad, Franco, Jos and Shawn

--
# SHA256 (OPNsense-17.1.b-OpenSSL-cdrom-amd64.iso.bz2) = 6ed4e335757f5f58e34f3f59984a06183612ed0cffd5a9238f85b1a156a56039
# SHA256 (OPNsense-17.1.b-OpenSSL-nano-amd64.img.bz2) = 70b89467d6dc9cadaa7c855764a8bb91f0fe118bba60074ab1d8f41362a7042a
# SHA256 (OPNsense-17.1.b-OpenSSL-serial-amd64.img.bz2) = affae7605fde77827e975597de5280db746f85c1ed38794ce647a6ad7c2f945d
# SHA256 (OPNsense-17.1.b-OpenSSL-vga-amd64.img.bz2) = 6f99cc3d0ef8d328eb43985b8d01cffe2e7f65e886015c65c84c062e33f15fbb
# SHA256 (OPNsense-17.1.b-OpenSSL-cdrom-i386.iso.bz2) = b799f8260ae1a55848c126d7be52c51e92ae3d11c0eaf347a506e7e59c92fd9c
# SHA256 (OPNsense-17.1.b-OpenSSL-nano-i386.img.bz2) = 86186e5b5af8be2818385497f8bdf5c3128c7864e502502676424193bcce9461
# SHA256 (OPNsense-17.1.b-OpenSSL-serial-i386.img.bz2) = 7b20afc07fc2ca45b6cee66c855d2576170a04684dae0cb65243a8abaa9be684
# SHA256 (OPNsense-17.1.b-OpenSSL-vga-i386.img.bz2) = 1fc58fade2e15a30afec82b3fff553344557e6903b69c2f48e20976373543d1e

# MD5 (OPNsense-17.1.b-OpenSSL-cdrom-amd64.iso.bz2) = 221b6b63642051518cd190b63775d5a5
# MD5 (OPNsense-17.1.b-OpenSSL-nano-amd64.img.bz2) = 67ff68890113bb2b4223a2336cfc5d01
# MD5 (OPNsense-17.1.b-OpenSSL-serial-amd64.img.bz2) = e757bef2fcb5e444cad8b7d8991314fe
# MD5 (OPNsense-17.1.b-OpenSSL-vga-amd64.img.bz2) = c2c56a542856fd0b84f299d7dd783b17
# MD5 (OPNsense-17.1.b-OpenSSL-cdrom-i386.iso.bz2) = c210c342a6d618e7c1ebcdefdf1e3f9d
# MD5 (OPNsense-17.1.b-OpenSSL-nano-i386.img.bz2) = 1c036f6707f9922c40748be44592462a
# MD5 (OPNsense-17.1.b-OpenSSL-serial-i386.img.bz2) = ff07d0d4f9e62a99896de8228ceba41b
# MD5 (OPNsense-17.1.b-OpenSSL-vga-i386.img.bz2) = 3f67a06ca99137d135d1fc9713912aff
