#!/bin/bash

VERSION_NAME=`grep -E "versionName" ${APP_FILE} | grep -oE '([0-9]{1,}\.)+[0-9]{1,}'`
MESSAGE= `sed  '1,/## [${VERSION_NAME}]/d;/## [.*]/Q' ${CHANGELOG_FILE}`
hub release create -a "${APP_FOLDER}" -m "${RELEASE_TITLE} - v${VERSION_NAME} /n${MESSAGE}" ${VERSION_NAME}
