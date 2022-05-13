#!/bin/sh
# Post-GrapheneOS setup steps

export PATH=$PATH:$HOME/Downloads/platform-tools

for pkg in $(adb shell pm list packages | sed s/package://g | egrep "\.(chromium|chrome|verizon|vending|wellbeing|recorder|files|gm|tips|youtube|music|amplifier|gmm|maps|googlequicksearchbox|docs)\$"); do
  adb shell pm disable-user --user 0 $pkg
  adb shell pm uninstall --user 0 $pkg
done

# Install 3rd party apps
apps="https://storage.evozi.com/apk/dl/16/09/08/com.teslamotors.tesla_443.apk
https://storage.evozi.com/apk/dl/20/08/17/app.olauncher_33.apk
https://updates.signal.org/android/Signal-Android-website-prod-universal-release-5.36.3.apk
https://storage.evozi.com/apk/dl/16/09/04/com.garmin.android.apps.connectmobile_5519.apk
https://storage.evozi.com/apk/dl/16/09/07/com.fujifilm_dsc.app.remoteshooter_29.apk
https://storage.evozi.com/zip/dl/16/09/04/com.google.android.apps.chromecast.app_0.zip
https://storage.evozi.com/apk/dl/16/09/04/com.google.android.keep_214810140.apk"

for a in $apps; do
  local=$(basename $a)

  if [ ! -f "${local}" ]; then
    curl -LO $a
  fi
  
  adb install $local
done
