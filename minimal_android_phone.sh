#!/bin/sh
# 
# Distraction-free Android installer
#
# This script will disable most sources of distractions on your phone. It requires
# USB debugging (Developer Mode) to be enabled, and is designed to be run right after
# a factory reset. It can also be run at any point afterwards.
#
# Think of it as a "LightPhone"-like experience on a stock-android phone
#
# What's it disable?
#
#   - Google Chrome / Chromium Web Browsers (but not the webview)
#   - Google Play Store
#   - Google Maps
#   - Gmail
#   - Verizon apps
#   - Wellbeing
#   - Audio Recorder
#   - Files
#   - Youtube Music
#   - Youtube
#   - Google Search Box
#   - Google Docs
#
# Recommended post-execution steps:
#
#   - Replace the Android launcher with olauncher
#   - Change your interface language to one you vaguely understand or want to learn more of
#   - Force your screen into monochrome mode (Settings -> Developer -> Simulate color space -> Monochromacy)
# 
readonly DISABLE_RE="\.(chromium|chrome|verizon|vending|wellbeing|recorder|files|gm|tips|youtube|music|amplifier|gmm|maps|googlequicksearchbox|docs)\$"

# Convenience for an extra path one might happen to have 'adb' installed.
export PATH=$PATH:$HOME/Downloads/platform-tools

# Disable and uninstall apps for user 0 (default)
for pkg in $(adb shell pm list packages | sed s/package://g | egrep "${DISABLE_RE}"); do
  adb shell pm disable-user --user 0 $pkg
  adb shell pm uninstall --user 0 $pkg
done

# Install 3rd party apps with a low likelihood of distraction
#
#   - Tesla
#   - olauncher (to replace the built-in Android launcher)
#   - Signal
#   - Garmin Connect (watch)
#   - Fuji Camera Remote
#   - Google Keep
#   - Google Home
#
# Mostly sourced through https://apps.evozi.com/apk-downloader/ (no guarantee against malware)
#
apps="https://storage.evozi.com/apk/dl/16/09/08/com.teslamotors.tesla_443.apk
https://storage.evozi.com/apk/dl/20/08/17/app.olauncher_33.apk
https://updates.signal.org/android/Signal-Android-website-prod-universal-release-5.36.3.apk
https://storage.evozi.com/apk/dl/16/09/04/com.garmin.android.apps.connectmobile_5519.apk
https://storage.evozi.com/apk/dl/16/09/07/com.fujifilm_dsc.app.remoteshooter_29.apk
https://storage.evozi.com/apk/dl/16/09/04/com.google.android.keep_214810140.apk
"

# If you need Google Home support, add:
# https://www.apkmirror.com/wp-content/uploads/2021/12/65/61af968ea9b62/com.google.android.apps.chromecast.app_2.47.1.10-24701100_minAPI23(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk?verify=1652403422-H1no4xuB1mWvwHcIrJLQj5GB7BiBw9yHOm39H6J8O4U
#
# For registering new Google home devices, you may need to enable Google:
#
# adb shell enable install-existing com.google.android.googlequicksearchbox --user 0
# adb shell pm enable com.google.android.googlequicksearchbox --user 0

for a in $apps; do
  local="$(basename $(echo $a | cut -d? -f1))"

  pkg=$(echo $local | cut -d_ -f1)
  adb shell pm list packages | grep ${pkg} && continue

  if [ ! -f "${local}" ]; then
    curl -L -o "${local}" "${a}"
  fi

  adb install $local
done
