# HIGHLY EXPERIMENTAL - Bluez v4.101 on ICS for Samsung Captivate Glide / SGH-i927

This will be the try to update bluez to the latest v4 (not v5). 

ICS / CM9 comes with 4.93 but the latest bluez version is 4.101 which
fixes a lot of things within bluez. I don't want to use v5 because there has been
many changes related to headset / headset profiles and several things does not work.

Do not expect anything! 

This is absolutely WIP!

Imported from: git://git.kernel.org/pub/scm/bluetooth/bluez.git


BlueZ - Bluetooth protocol stack for Linux
******************************************

Copyright (C) 2000-2001  Qualcomm Incorporated
Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>


Compilation and installation
============================

In order to compile Bluetooth utilities you need following software packages:
	- Linux Bluetooth protocol stack (BlueZ)
	- GCC compiler
	- D-Bus library
	- GLib library
	- USB library (optional)
	- Lexical Analyzer (flex, lex)
	- YACC (yacc, bison, byacc)

To configure run:
	./configure --prefix=/usr --mandir=/usr/share/man \
		--sysconfdir=/etc --localstatedir=/var --libexecdir=/lib

Configure automatically searches for all required components and packages.

To compile and install run:
	make && make install


Information
===========

Mailing lists:
	linux-bluetooth@vger.kernel.org

For additional information about the project visit BlueZ web site:
	http://www.bluez.org
