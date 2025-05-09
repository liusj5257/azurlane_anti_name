#!/bin/bash


# Download Azur Lane
# Download Azur Lane
download_azurlane () {
    if [ ! -f "AzurLane.apk" ]; then
    url="https://s2.g.mi.com/034627d60ca959e3c535e11989305924/1747361792/package/AppStore/024db3d6bc5c74227838ab997e88123d30ebec9d1/eyJhcGt2Ijo5NTEwLCJuYW1lIjoiY29tLmJpbGliaWxpLmJsaHgubWkiLCJ2ZXJzaW9uIjoiMS4wIiwiY2lkIjoibWVuZ18xNDM5XzM0NV9hbmRyb2lkIiwibWQ1IjpmYWxzZX0/9a79b483552727b4f2bf0000c6084fc6"
    # curl -o blhx.apk -L $url
    axel -n 16 -k -o blhx.apk $url
    fi
}

if [ ! -f "AzurLane.apk" ]; then
    echo "Get Azur Lane apk"
    download_azurlane
    mv *.apk "AzurLane.apk"
fi


echo "Decompile Azur Lane apk"
java -jar apktool.jar  -f d AzurLane.apk

echo "Copy libs"
cp -r libs/. AzurLane/lib/

echo "Patching Azur Lane"
oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali/com/unity3d/player/UnityPlayerActivity.smali

oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali

oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes3/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes3/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes3/com/unity3d/player/UnityPlayerActivity.smali


echo "Build Patched Azur Lane apk"
java -jar apktool.jar  -f b AzurLane -o AzurLane.patched.apk

echo "Set Github Release version"

echo "PERSEUS_VERSION=$(echo XiaoMi)" >> $GITHUB_ENV

mkdir -p build
mv *.patched.apk ./build/
find . -name "*.apk" -print
