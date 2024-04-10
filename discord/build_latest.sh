#!/bin/bash

LATEST_FILENAME=$(ls discord*.deb | sort | tail -n1)
LATEST_VERSION=$(echo ${LATEST_FILENAME%.*} | cut -d- -f 2)

VERSION=${LATEST_VERSION} ./discord.SlackBuild

