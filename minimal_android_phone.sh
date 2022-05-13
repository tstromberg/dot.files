#!/bin/sh
# Post-GrapheneOS setup steps

export PATH=$PATH:$HOME/Downloads/platform-tools

for pkg in $(adb shell pm list packages | sed s/package://g | egrep "\.(chromium|chrome|verizon|vending|wellbeing|recorder|files|gm|tips|youtube|music|amplifier|gmm|maps|googlequicksearchbox|docs)\$"); do
  adb shell pm disable-user --user 0 $pkg
  adb shell pm uninstall --user 0 $pkg
done

# Install 3rd party apps with a low likelihood of distraction
#
#   - Tesla
#   - olauncher (minimal replacement for the Android launcher)
#   - Signal
#   - Garmin Connect (watch)
#   - Fuji Camera Remote
#   - Google Keep
#   - Google Home
apps="https://storage.evozi.com/apk/dl/16/09/08/com.teslamotors.tesla_443.apk
https://storage.evozi.com/apk/dl/20/08/17/app.olauncher_33.apk
https://updates.signal.org/android/Signal-Android-website-prod-universal-release-5.36.3.apk
https://storage.evozi.com/apk/dl/16/09/04/com.garmin.android.apps.connectmobile_5519.apk
https://storage.evozi.com/apk/dl/16/09/07/com.fujifilm_dsc.app.remoteshooter_29.apk
https://storage.evozi.com/apk/dl/16/09/04/com.google.android.keep_214810140.apk
https://www.apkmirror.com/wp-content/uploads/2021/12/65/61af968ea9b62/com.google.android.apps.chromecast.app_2.47.1.10-24701100_minAPI23(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk?verify=1652403422-H1no4xuB1mWvwHcIrJLQj5GB7BiBw9yHOm39H6J8O4U
"

for a in $apps; do
  local="$(basename $(echo $a | cut -d? -f1))"

  pkg=$(echo $local | cut -d_ -f1)
  adb shell pm list packages | grep ${pkg} && continue

  if [ ! -f "${local}" ]; then
    curl -L -o "${local}" "${a}"
  fi

  adb install $local
done
