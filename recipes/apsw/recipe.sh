#!/bin/bash

VERSION_apsw=
URL_apsw=
DEPS_apsw=(python)
MD5_apsw=
BUILD_apsw=$BUILD_PATH/apsw/apsw
RECIPE_apsw=$RECIPES_PATH/apsw

function prebuild_apsw() {
	cd $BUILD_PATH/apsw

	if [ ! -d apsw ]; then
		try cp -a $RECIPE_apsw/src $BUILD_apsw
	fi
}

function build_apsw() {

	if [ -e "$BUILD_PATH/python-install/lib/python2.7/site-packages/apsw.so" ]; then
		return
	fi

	cd $BUILD_apsw
	push_arm
	try $BUILD_PATH/python-install/bin/python.host setup.py build --enable load_extension --enable-all-extensions install
	pop_arm
}

function postbuild_apsw() {
	true
}
