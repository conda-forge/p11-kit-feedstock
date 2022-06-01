#!/bin/bash
set -x

if [[ $CONDA_BUILD_CROSS_COMPILATION == "1" ]]; then
    # Get an updated config.sub and config.guess
    cp $BUILD_PREFIX/share/gnuconfig/config.* .
    curl -L -O https://raw.githubusercontent.com/p11-glue/p11-kit/0.23.21/autogen.sh
    chmod +x autogen.sh
    bash ./autogen.sh
fi

./configure --prefix=$PREFIX \
            --with-trust-paths=$PREFIX/ssl/cert.pem
make
make install
