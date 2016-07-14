@ July 14, 2016

Good news everyone,

16.7-RC2 is here and brings major additions to amd64 architectures: Intel's
Hyperscan library to speed up Suricata rule matching and UEFI boot support!
It also brings language packs to their correct 16.7 state, with Japanese
already having been completed by the amazing Chie Taguchi.

The mirrors have been expanded to allow trackers of -stable or -devel
packages to upgrade to the release candidate.  Users of LibreSSL wanting
to upgrade can now switch to OpenSSL instead of seeing upgrade errors
until LibreSSL becomes available again and their systems move back to
LibreSSL automatically.

Otherwise, only minor issues have been reported and fixed.  This likely
means there will not be another release candidate.

New images are available from all known mirrors, checksums are found below:

https://opnsense.org/download/

Here is the list of all changes since 16.7-RC1:

o vga: UEFI boot support on amd64
o cdrom: UEFI boot support on amd64
o nano: firmware is now always fetched to persistent storage
o ports: python 2.7.12[1], squid 3.5.20[2], pkg 1.8.7[3],
  hyperscan 4.2.0[4]
o installer: allow installation on /dev/raid devices
o installer: added a welcome message
o installer: added GPT/UEFI mode on amd64
o lang: only allow to select stable languages
o lang: first update for 16.7 with full Japanese translation
  (contributed by Chie Taguchi)
o lang: numerous cleanups in translations (contributed by Fabian Franz)
o interfaces: correctly restart all running DNS services on interface
  reload
o interfaces: properly configure OpenVPN interfaces on bootup
o interfaces: fix iteration over empty interface array
o interfaces: do not show dhcpd6 service when prefix delegation is
  not enabled
o openvpn: repaired status page to show service status
o openvpn: refactored scripting in export page
o firmware: enable trim even for GPT/UFS labeled root file systems
o firmware: removed / disabled defunct mirrors
o firmware: removed deprecated status.php page
o intrusion detection: allow to select pattern matcher, e.g.
  Intel's Hyperscan
o wizard: fix misalignment on page titles and contents
o firewall: fix missing dependency in alias download script
o firewall: correctly skip "//" type comments in remote alias files
o firewall: validate IP or alias in NPT source / destination
o proxy: do not escape output twice in page
o proxy: move ACL parts to separate file and allow pre and post hooks


Stay safe,
Your OPNsense team

--
[1] https://hg.python.org/cpython/raw-file/v2.7.12/Misc/NEWS
[2] ftp://ftp.meisei-u.ac.jp/mirror/squid/squid-3.5-ChangeLog.txt
[3] https://github.com/freebsd/freebsd-ports/commit/06593f2394
[4] https://01.org/hyperscan

# SHA256 (OPNsense-16.7.r2-OpenSSL-cdrom-amd64.iso.bz2) = ebf55f742bf096a14702726f4a959bec40092e41fc718481b6ed6c1a0d173233
# SHA256 (OPNsense-16.7.r2-OpenSSL-nano-amd64.img.bz2) = 95bc2671d97937f03492a46f7eae1ff3f18e9ccbae4b50016d0566025e1fbfea
# SHA256 (OPNsense-16.7.r2-OpenSSL-serial-amd64.img.bz2) = bc96863150c534c1edf5a9f525382122b28b01dd27df3e3b1dea89a6c941c031
# SHA256 (OPNsense-16.7.r2-OpenSSL-vga-amd64.img.bz2) = 8a1d5e5bf90c3cedd81527152c76911d09121dbd98de37d9c5b981191b827812
# SHA256 (OPNsense-16.7.r2-OpenSSL-cdrom-i386.iso.bz2) = b8aa7c28d3fe7d76eb0bdf5f02c9d14bea42364587e0bd81adb461430a1eb018
# SHA256 (OPNsense-16.7.r2-OpenSSL-nano-i386.img.bz2) = 6f017b73c0e850054fbc43a409942c0855fea0a2e10fdf43a6e5b009211cdd00
# SHA256 (OPNsense-16.7.r2-OpenSSL-serial-i386.img.bz2) = 9558be99ebf9b54d6350108a9ff237c2fbc87f4f80a1ac8a3297819c44a56de0
# SHA256 (OPNsense-16.7.r2-OpenSSL-vga-i386.img.bz2) = f0cbdff9765138106f6f055de53fc810ed48e5a15f0def795dc6039351a39368

# MD5 (OPNsense-16.7.r2-OpenSSL-cdrom-amd64.iso.bz2) = cc1522078c8eb3bdca5ee4423ffef828
# MD5 (OPNsense-16.7.r2-OpenSSL-nano-amd64.img.bz2) = 64a3c7debe67366a28dcefaeaa7599fa
# MD5 (OPNsense-16.7.r2-OpenSSL-serial-amd64.img.bz2) = 04a05db79ac1b4a64a216e94b59bc0f6
# MD5 (OPNsense-16.7.r2-OpenSSL-vga-amd64.img.bz2) = 720441975be264eb9930b894b604fe62
# MD5 (OPNsense-16.7.r2-OpenSSL-cdrom-i386.iso.bz2) = 9d38019afe7c0c549fd250e193ea18a2
# MD5 (OPNsense-16.7.r2-OpenSSL-nano-i386.img.bz2) = 8b094505b7e73c675e3591ff1307f5cf
# MD5 (OPNsense-16.7.r2-OpenSSL-serial-i386.img.bz2) = b4b7f1cb56d7fff74cc72d7786cc2a63
# MD5 (OPNsense-16.7.r2-OpenSSL-vga-i386.img.bz2) = a85285bc4873ae56c3d6e721c1f7c064
