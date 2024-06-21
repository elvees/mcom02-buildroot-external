#!/bin/bash

# Copyright 2024 RnD Center "ELVEES", JSC

# This script is needed to run Weston on Buildroot. It setups $XDG_RUNTIME_DIR variable. Usually
# this is done by some system service (e. g. logind), but it's OK to set this variable manually for
# embedded systems.

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/run/user/0
    if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
        mkdir --parents "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ ! -e /etc/environment ] || ! grep -q $XDG_RUNTIME_DIR /etc/environment; then
    echo XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR >> /etc/environment
fi
