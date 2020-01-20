#!/bin/env bash
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://alpha.de.repo.voidlinux.org|http://alpha.us.repo.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf

