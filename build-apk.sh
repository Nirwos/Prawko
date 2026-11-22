#!/bin/bash
set -euo pipefail
APP_DIR=/srv/NPKTeam/Prawko-App
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 ANDROID_HOME=/opt/android-sdk
VERSION_NAME=$(python3 -c "import json;print(json.load(open('$APP_DIR/app-version.json'))['versionName'])")
cd "$APP_DIR" && npx cap sync android
cd android && GRADLE_USER_HOME="$APP_DIR/android/.gradle-home" ./gradlew --no-daemon -q assembleRelease
APK=app/build/outputs/apk/release/app-release.apk
"$ANDROID_HOME"/build-tools/34.0.0/apksigner verify "$APK"
mkdir -p "$APP_DIR/release"
install -m 644 "$APK" "$APP_DIR/release/prawko-$VERSION_NAME.apk"
echo "GOTOWE: $APP_DIR/release/prawko-$VERSION_NAME.apk"
