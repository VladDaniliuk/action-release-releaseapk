#!/bin/bash

VERSION_NAME=`grep -E "versionName" ${APP_FILE} | grep -oE '([0-9]{1,}\.)+[0-9]{1,}'`
MESSAGE=$(awk -v ver="$VERSION_NAME" '/^#+ \[/ { if (p) { exit }; if ($CHANGELOG_FILE == "["ver"]") { p=1; next} } p && NF' "$CHANGELOG_FILE")
hub release create -a "${APP_FOLDER}" -m "${RELEASE_TITLE} - v${VERSION_NAME} /n${MESSAGE}" ${VERSION_NAME}
