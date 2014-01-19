#!/bin/bash

VERSION_pyescpos=1.0-1
URL_pyescpos=https://python-escpos.googlecode.com/files/python-escpos-$VERSION_pyescpos.zip
DEPS_pyescpos=(python)
MD5_pyescpos=
BUILD_pyescpos=$BUILD_PATH/pyescpos/$(get_directory $URL_pyescpos)
RECIPE_pyescpos=$RECIPES_PATH/pyescpos

function prebuild_pyescpos() {
	true
}

function build_pyescpos() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/escpos" ]; then
		return
	fi

	cd $BUILD_pyescpos
	push_arm
	cp ~/escpos.py  /mnt/disk/extra/android/python-for-android/build/pyescpos/python-escpos-1.0-1/escpos
	try $BUILD_PATH/python-install/bin/python.host setup.py build install
	pop_arm
}

function postbuild_pyescpos() {
	true
}
