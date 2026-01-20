@ December 19, 2024

Hey all,

The 25.1 series will include FreeBSD 14.2 so we are putting this BETA
version out based on the latest development state.  This is not meant
for production use but all plugins are provided and future updates of
installations based on these images will be possible.

https://pkg.opnsense.org/releases/25.1/

There is a bit more work to be done yet most of the milestones have
already been reached.  If you have a test deployment or would like to
check out some of the new features these images are for you.  Together
we can make OPNsense better than it ever was.

The final release date for 25.1 is January 29.  A release candidate
will follow in early January.

Highlights over version 24.7 include:

o system: restructure PPP to accommodate IPv6-only deployments
o system: implement persistent notifications banner
o system: dashboard widget for certificate expiry and renew
o system: high availablilty status MVC/API conversion
o system: users and groups MVC/API conversion
o system: advanced trust settings page
o system: ZFS snapshot GUI
o reporting: RRD health graph refactoring
o firewall: improved security zones support and documentation
o ipsec: advanced settings MVC/API conversion
o unbound: merge domain overrides into query forwarding
o ui: theme update with new styling and add official dark theme
o src: FreeBSD 14.2

The public key for the 25.1 series is:

# -----BEGIN PUBLIC KEY-----
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAsnbyFjWXvUcUC4BqnQ9w
# uH3yiaG7AY8UzwepXf2TqqOYt5Y0USbse3OBjxYnRs0iW5EHtdKSRcmelup374Hp
# XDDeQ/mjmhhnvXryfQL57gyVpYeL5gRVhf/2DwEZELLCFUFhMNh52QPaJ5zTvdws
# m1Q+OwI1WfTDR7ytm+0Too2tVerG3mM3XataZ+XOKwHp2xP0Mr8E4F+PZdR4hWbb
# yC2elIzICXDWWpcEEg4JT48TIYZJPGnE2IJAzWRntrqVU2eLcEn5MffwTawXNoCZ
# mvLYqguYskmeR/dAL7ZmZcPeMeibXMtld8xIZp49g7DPq7PqxCY1wxcgeuZPFOHv
# kbYzL3BHbyni3K/qdLXKzy8oZeUUvlbUgaj8Xx14DSiNzJDknNf0Xg/eby7MkzgP
# eUXgtB0MRQMih85BfaiH5r+uQMgPKnjutVWR8qUWglxDKIc4s69b8PXylfu2FwiP
# iKMBdO8xnVvNFKOkuaUtI31cqxauw2hBAlILFvltM+adUz2rfB3Ch0bjfjDE5Hxq
# En4fEUVHgQCu+Ojyyy3/8RwUpsRZq05fObypyeL3E/MvlwpaOVjwvw2ozVPGi2zi
# xmXemn5CbgjD3vPR9XERXrFkHTwPnIiqz53znqn34P+NGEgD1veMhZPE6OGZRu/h
# IfceSaxJ/An5SUh0zr7YgOsCAwEAAQ==
# -----END PUBLIC KEY-----

Please let us know about your experience!


Stay safe,
Your OPNsense team

--
# SHA256 (OPNsense-devel-25.1.b-dvd-amd64.iso.bz2) = 7a9a5eacc65f7128273558c7e5f4cf63e555004d4d938fb827280cf691fc1cfd
# SHA256 (OPNsense-devel-25.1.b-nano-amd64.img.bz2) = 83b3a9b599477773b8f4877bf8c4a38436895477fef91a0dbfabdbfdbb7be2c3
# SHA256 (OPNsense-devel-25.1.b-serial-amd64.img.bz2) = 57d087cf66d168338de4a611871c31813b3e42bb71d7b71be75aa20521c6d8a1
# SHA256 (OPNsense-devel-25.1.b-vga-amd64.img.bz2) = 5bc51cc93bc64cc15d6fa68611d3cee4cf45b70b85e713cbdd3c0c8d2ebd4137
