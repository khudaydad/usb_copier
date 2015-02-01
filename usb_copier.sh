#!/bin/bash

#
# Copyright (C) 2015 Khudaydad Mahmoodi
#

DEST=/tmp/usb_content

if [ ! -d "${DEST}" ]; then
    mkdir -p $DEST

    while [ 1 ]; do
        USB=`mount | grep -E '/dev/sd.*/media' | cut -d' ' -f3`
        if [ -e "$USB" ]; then
            cp -R $USB/* $DEST
            break
        else
            sleep 5
        fi
    done
fi