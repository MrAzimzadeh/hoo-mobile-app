#!/usr/bin/env bash
# Resizes tool/icon/icon_master.png / icon_foreground.png into the iOS AppIcon set and Android mipmaps (macOS `sips`).
set -euo pipefail
cd "$(dirname "$0")/../.."
M=tool/icon/icon_master.png
F=tool/icon/icon_foreground.png
TMP=$(mktemp -d)
# App Store icons must not carry an alpha channel: round-trip through JPEG.
sips -s format jpeg "$M" --out "$TMP/master.jpg" >/dev/null
IOS=ios/Runner/Assets.xcassets/AppIcon.appiconset
for spec in 20x20@1x:20 20x20@2x:40 20x20@3x:60 29x29@1x:29 29x29@2x:58 29x29@3x:87 40x40@1x:40 40x40@2x:80 40x40@3x:120 \
            60x60@2x:120 60x60@3x:180 76x76@1x:76 76x76@2x:152 83.5x83.5@2x:167 1024x1024@1x:1024; do
  name=${spec%%:*}; px=${spec##*:}
  sips -s format png -z "$px" "$px" "$TMP/master.jpg" --out "$IOS/Icon-App-$name.png" >/dev/null
done
RES=android/app/src/main/res
for spec in mdpi:48:108 hdpi:72:162 xhdpi:96:216 xxhdpi:144:324 xxxhdpi:192:432; do
  IFS=: read -r d legacy fg <<<"$spec"
  sips -s format png -z "$legacy" "$legacy" "$TMP/master.jpg" --out "$RES/mipmap-$d/ic_launcher.png" >/dev/null
  mkdir -p "$RES/drawable-$d"
  sips -z "$fg" "$fg" "$F" --out "$RES/drawable-$d/ic_launcher_foreground.png" >/dev/null
done
mkdir -p "$RES/mipmap-anydpi-v26"
cat > "$RES/mipmap-anydpi-v26/ic_launcher.xml" <<'XML'
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/hoo_black" />
    <foreground android:drawable="@drawable/ic_launcher_foreground" />
    <monochrome android:drawable="@drawable/ic_launcher_foreground" />
</adaptive-icon>
XML
rm -rf "$TMP"
echo "icons updated"
