#!/bin/bash

export LDFLAGS="$LDFLAGS -Wl,-rpath,$BUILD_PREFIX/lib"

if [ `uname` == Linux ]; then
	chmod +x configure
	./configure \
		--prefix=$PREFIX \
		--enable-thread-safety \
		--with-openssl \
		--with-zlib \
		--without-python \
		--with-libedit-preferred \
		--without-perl \
		--without-tcl \
		--enable-rpath \
		--libdir="${PREFIX}/lib"
fi

make || exit 1
make -C src/bin install
make -C src/include install
make -C src/interfaces install
# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
