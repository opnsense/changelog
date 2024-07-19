@ July 19, 2024

Hi there,

For more than 9 and a half years now, OPNsense is driving innovation
through modularising and hardening the open source firewall, with simple
and reliable firmware upgrades, multi-language support, fast adoption
of upstream software updates as well as clear and stable 2-Clause BSD
licensing.

We thank all of you for helping test, shape and contribute to the project!
We know it would not be the same without you.  <3

Download links, an installation guide[1] and the checksums for the images
can be found below as well.

o Europe: https://opnsense.c0urier.net/releases/24.7/
o US East Coast: https://mirror.wdc1.us.leaseweb.net/opnsense/releases/24.7/
o US West Coast: https://mirror.sfo12.us.leaseweb.net/opnsense/releases/24.7/
o South America: http://mirror.ueb.edu.ec/opnsense/releases/24.7/
o East Asia: https://mirror.ntct.edu.tw/opnsense/releases/24.7/
o Full mirror list: https://opnsense.org/download/

Here are the full changes against version 24.7-RC1:

o system: assorted dashboard widget tweaks
o system: sidebar optimisation and fixes (contributed by Team Rebellion)
o installer: update the ZFS install script to the latest FreeBSD 14.1 code
o mvc: remove obsolete getParams() usage in ApiControllerBase
o mvc: hook default index action in API handler
o src: assorted backports from FreeBSD stable/14 branch
o plugins: os-caddy 1.6.1[2]
o plugins: os-dec-hw 1.1 replaces new dashboard widget
o plugins: os-nginx 1.34[3]
o plugins: os-theme-cicada 1.37 fixes dropdown element style (contributed by Team Rebellion)
o plugins: os-theme-vicuna 1.47 fixes dropdown element style (contributed by Team Rebellion)

Migration notes, known issues and limitations:

o The dashboard has been replaced. Widgets from the old format are no longer supported and need to be rewritten by the respective authors.
o ISC DHCP will no longer reload DNS services on static mapping edits. This is for feature parity with Kea DHCP and avoiding cross-service complications. If you expect your static mappings to show up in a DNS service please restart it manually.

The public key for the 24.7 series is:

# -----BEGIN PUBLIC KEY-----
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAunCgLymz7ichjk+uZ4pR
# XwFX8FxG0KFBf4f6kCfQ+wNF9KTFBELzGg2tXPUmrJD/DzcMqQExP3WyTg0Z96ZW
# HofN2AbOCG84PpNlsKXpaUtm9Ow8kiYh7tn26eX7FaOEPtpJkMiwUymbCJJaPE0O
# smQbWGnJTvF8LTmuviPoiMrPv1cJ0kEyJvjDD0yMw1HrIgwPOazGmTQiuM3LoLOK
# F0KWf2p40c77QDOuGC7AIobQgDkZTabfU7PQUn6gDiKARYCst7y2xX3OQ7foXCJW
# nDDypfbfHixv77mVAeIED0h9ZsQaIHskL2dqqRbFHiY+OHjQTCAJP1Ptm/HGSCdj
# GOjpuD4WXvxru8AgcOCh6GpqO4IbByIHXu+67Ur3UBlxsp4x44lxBWXQzeemVhaS
# ZAmkJNemw51oRDTxYtpR7TF3OlgLAQBOB/0tqHmkbSBouQ6PK7HYzNglu9LStxo1
# uxgMss5q8GoZCkWKvRDz87YceeC75l0aWOVnkOMmC5Lf+fFMJp6TF7BzCi3ZC7CD
# DQchBlE2F98D3E7KiI4vGrLUj3qKwfwV41JSQ8OtwOV+KFGOmyHeNassTQHm1Mdn
# reTzHeusqUdAL7+pXH1XNwoFSZo7A6RoZzTzb0p7WYbKU9SV39DPytsYES7FsyY8
# l7+AsM+sBOY1ngeB/twBzyUCAwEAAQ==
# -----END PUBLIC KEY-----

Please let us know about your experience!


Stay safe,
Your OPNsense team

--
[1] DOCS:manual/install
[2] PLUGINS:24.7/www/caddy
[3] PLUGINS:24.7/www/nginx

# SHA256 (OPNsense-24.7.r2-dvd-amd64.iso.bz2) = 43617bcb97b40a4c681c9468e0f7837aef9e7ff3849377649ab350287ad4639b
# SHA256 (OPNsense-24.7.r2-nano-amd64.img.bz2) = 8fad59de6fdb07b9df2edb637a9d5f18a892d462d76118da6270dede90180a35
# SHA256 (OPNsense-24.7.r2-serial-amd64.img.bz2) = 5c4d9b6f7ef4baf555c43d949f5946b59856fea45303a4b32890c102909d9f75
# SHA256 (OPNsense-24.7.r2-vga-amd64.img.bz2) = 46f78b3fa40a429f52adbe1caf923cb8f4856e01ff61888b3db2658b43fe3f56
