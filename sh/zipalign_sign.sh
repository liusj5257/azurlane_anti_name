#!/bin/bash
PATH=$PATH:$ANDROID_HOME/build-tools/32.0.0/
for f in build/*.apk; do
    mv $f ${f%.apk}.apk.unsigned
    echo "Zipaligning $f"
    zipalign -pvf 4 ${f%.apk}.apk.unsigned $f
    rm ${f%.apk}.apk.unsigned
    echo "Signing $f"
    echo $(apksigner --version)
    apksigner sign --key testkey.pk8 --cert testkey.x509.pem $f
done