# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit unpacker

DESCRIPTION="Netease cloud music player"
HOMEPAGE="http://music.163.com"
COMMON_URI="http://s1.music.126.net/download/pc"
SRC_URI="
amd64? ( ${COMMON_URI}/${PN}_${PV}_amd64_ubuntu14.04.deb )
x86? ( ${COMMON_URI}/${PN}_${PV}_i386_ubuntu14.04.deb )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtkstyle hidpi"
RESTRICT="mirror strip"

DEPEND="
>=dev-db/sqlite-3.8.2
>=dev-libs/atk-2.10.0
>=dev-libs/expat-2.1.0
>=dev-libs/glib-2.40.0
>=dev-libs/nspr-4.12
>=dev-libs/nss-3.26.2
>=dev-libs/openssl-1.0.1f
>=dev-qt/qtcore-5.2.1
>=dev-qt/qtdbus-5.2.1
>=dev-qt/qtgui-5.2.1
>=dev-qt/qtmultimedia-5.1.1[widgets,gstreamer]
>=dev-qt/qtnetwork-5.2.1
>=dev-qt/qtwidgets-5.2.1
>=dev-qt/qtx11extras-5.2.1
>=dev-qt/qtxml-5.2.1
>=media-libs/alsa-lib-1.0.25
>=media-libs/fontconfig-2.11.0
>=media-libs/freetype-2.5.2-r1
>=media-libs/taglib-1.9.1 
>=net-print/cups-1.7.2
>=sys-apps/dbus-1.6.18
>=sys-devel/gcc-4.8.2
>=sys-libs/glibc-2.19
>=sys-libs/zlib-1.2.8
>=x11-libs/cairo-1.13.0
>=x11-libs/gdk-pixbuf-2.30.7
>=x11-libs/gtk+-2.24.23
>=x11-libs/libX11-1.6.2
>=x11-libs/libXi-1.7.1
>=x11-libs/libXrandr-1.4.2
>=x11-libs/pango-1.36.3
>=x11-libs/libXcursor-1.1.14
dev-qt/qtsql[sqlite]
gtkstyle? ( >=dev-qt/qtgui-5.0.2[gtkstyle] )
media-libs/libcue
media-plugins/gst-plugins-meta:1.0
x11-libs/libXScrnSaver
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXrender
x11-libs/libXtst
"

RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r ${S}/usr

	dodir /usr/bin
	exeinto /usr/bin
	doexe ${FILESDIR}/${PN}

	dodir /usr/lib/${PN}
	exeinto /usr/lib/${PN}
	doexe ${S}/usr/lib/${PN}/chrome-sandbox
	fperms 4755 /usr/lib/${PN}/chrome-sandbox
	doexe ${S}/usr/lib/${PN}/netease-cloud-music

	# fix HiDPI screen display
	if use hidpi; then
		dodir /usr/lib/${PN}
		exeinto /usr/lib/${PN}
		doexe ${FILESDIR}/${PN}-hidpi
	fi
}
