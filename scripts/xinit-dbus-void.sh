#!/bin/env bash
# Get dbus session bus address working in a void kde elogind setup
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
    eval `dbus-launch --sh-syntax`
fi

