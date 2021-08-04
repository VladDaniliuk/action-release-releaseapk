#!/bin/bash

hub checkout ${${REPO_BRANCH}:-master}
VERSION_NAME=`grep -E "${VERSION_VARIABLE}" ./${APP_FILE} | grep -oE '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}'`
hub release create -a ./${APP_FOLDER}/build/outputs/apk/release/*-release.apk -m "${RELEASE_TITLE} - v${VERSION_NAME}"
