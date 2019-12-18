#!/usr/bin/env bash

. ~/.setuptools/lib/platform.sh

function configure {

    PLATFORM=`operating_system`

    if [ -e $HOME/.setuptools/config/master ]; then
        rm -f $HOME/.setuptools/config/master
    fi
    touch $HOME/.setuptools/config/master

    if [ ${PLATFORM} = "macOS" ]; then
        echo "PLATFORM=macOS" >> $HOME/.setuptools/config/master
    fi
}