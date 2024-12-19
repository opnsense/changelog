@ June 13, 2024

Hello there,

Since OPNsense 24.7 will be based on a newer FreeBSD major version
it is crucial for us to release these BETA images based on the latest
development state.  This is not meant for production use but all plugins
are provided and future updates of installations based on these images
will be possible.

https://pkg.opnsense.org/releases/24.7/

There is a bit more work to be done yet most of the milestones have
already been reached.  If you have a test deployment or would like to
check out some of the new features these images are for you.  Together
we can make OPNsense better than it ever was.

The final release date for 24.7 is July 24.  A release candidate will
follow in early July.

Highlights over the current 24.1 series include:

o Dashboard replacement with streaming widgets
o System: High Availability: Settings page has been converted to MVC
o System: Trust section has been converted to MVC/API
o Interfaces: GIF section has been converted to MVC/API
o Interfaces: GRE section has been converted to MVC/API
o Firewall: NAT 1-to-1 has been converted to MVC/API
o Added experimental OpenVPN DCO device type support
o Added unicast CARP support to Virtual IPs
o DHCPv6 on WAN can now assign a prefix subnet to itself and support static interface identifiers
o Built-in cache capability for backend commands
o Captive portal backend refactor and new "Allow inbound interfaces" option
o Large portions of Phalcon MVC have been replaced by native PHP implementation
o FreeBSD 14.1

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
# SHA256 (OPNsense-devel-24.7.b-dvd-amd64.iso.bz2) = af740f12d4363d13e96ad95ac06dd1d659009c345af3e8ff6d544a66200ba93f
# SHA256 (OPNsense-devel-24.7.b-nano-amd64.img.bz2) = 394e150c3cb22b7f2d2b131fc2bcb545355e6a129b7d9afe2ced9c4364bfa862
# SHA256 (OPNsense-devel-24.7.b-serial-amd64.img.bz2) = a8770d247400859e66151aae177171f141ea7064de98728edfc22a77d8d5f447
# SHA256 (OPNsense-devel-24.7.b-vga-amd64.img.bz2) = 046bba7c48312578f819535a0f29210e24f9bcb1e8153256fb15a35a62f3d443
