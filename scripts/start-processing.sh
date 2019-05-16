#!/bin/sh

cd "$(dirname $0)/.."

OUTDEVICE="$(aconnect -l | scripts/client-mapping.py 20)"	# Xio
KEYBOARD="$(aconnect -l | scripts/client-mapping.py 24)"	# Arturia Keystep
CONTROLLER="$(aconnect -l | scripts/client-mapping.py 28)"	# Launch Control XL

chuck classes/* \
    "process_notes.ck:${KEYBOARD}:${OUTDEVICE}" \
    "process_nomod.ck:${KEYBOARD}:${OUTDEVICE}" \
    "process_cc.ck:${CONTROLLER}:${OUTDEVICE}"
