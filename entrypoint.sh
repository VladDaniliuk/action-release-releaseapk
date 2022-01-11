#!/bin/bash

VERSION_NAME=`grep -E "${VERSION_VARIABLE}" ${APP_FILE} | grep -oE '([0-9]{1,}\.)+[0-9]{1,}'`
hub release create -a ./${APP_FOLDER}/build/outputs/apk/release/"${NAME_VARIABLE}" -m "${RELEASE_TITLE} - v${VERSION_NAME}" ${VERSION_NAME}
