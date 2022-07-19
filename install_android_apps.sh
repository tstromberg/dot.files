#!/bin/sh

# Install 3rd party apps with a low likelihood of distraction
#
#   - Tesla
#   - olauncher (to replace the built-in Android launcher)
#   - Signal
#   - Garmin Connect (watch)
#   - Fuji Camera Remote
#   - Google Keep
#   - Google Home
#   - Lyft
#
# Mostly sourced through https://apps.evozi.com/apk-downloader/ (no guarantee against malware)
#
apps="https://www.apkmirror.com/wp-content/uploads/2022/05/85/628bd3fbc89d7/com.teslamotors.tesla_4.9.0-1051-1051_minAPI24(arm64-v8a,armeabi-v7a,x86_64)(nodpi)_apkmirror.com.apk?verify=1653835892-k3BRopdJiMR06aKA-YHH2pwDY4VGFN9I3EKgJS07zhE
https://www.apkmirror.com/wp-content/uploads/2022/05/55/628eaccc4f26b/com.google.android.apps.photos_5.91.0.450501534-43446247_minAPI23(arm64-v8a)(nodpi)_apkmirror.com.apk?verify=1653835952-q2wS9L3bejikf-_MN91FhAdzmv1ecmgR5z3lX_KGrSA
https://www.apkmirror.com/wp-content/uploads/2022/05/44/6282c18142a12/me.lyft.android_7.36.3.1652249853-1652249853_minAPI23(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk?verify=1653342486-jOzTEORjjGccNs3IF_CB4OasPpe-_LowDse6jSPVoIo
https://www.apkmirror.com/wp-content/uploads/2019/05/5ce0a88f379db/com.codebutler.farebot_3.1.1-29_minAPI21(nodpi)_apkmirror.com.apk?verify=1653836077--KHrtQhpSPZcKmShkjoUPj5MoVUiuHKWJaRM4N0mM7k
https://www.apkmirror.com/wp-content/uploads/2022/05/49/62900ff5890db/com.google.android.apps.tachyon_167.0.449603975.duo.android_20220515.12_p3-3645090_minAPI23(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk?verify=1653836244-vV8yLF6Y0HpBZFMRObmLinkIO4bQAkAvUIFzRAGzWSU
https://storage.evozi.com/apk/dl/20/08/17/app.olauncher_33.apk
https://updates.signal.org/android/Signal-Android-website-prod-universal-release-5.39.3.apk
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
  # adb shell pm list packages | grep ${pkg} && continue

  if [ ! -f "${local}" ]; then
    curl -L -o "${local}" "${a}"
  fi

  adb install $local
done
