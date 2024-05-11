#!/bin/bash

# Download Azur Lane
download_azurlane () {
    if [ ! -f "AzurLane.apk" ]; then
    #这个链接是百度 https://mobile.baidu.com/item?docid=5008915318&f0=search_searchContent%400_appBaseNormal%400&advitem=source%2Bnatural%40pos%2B1%40bid%2B0%40ctr%2B0.000000%40trans%2B%40keyword%2B%E7%A2%A7%E8%93%9D%E8%88%AA%E7%BA%BF%40app_rcv%2B
    url="https://112-29-199-43-yf11103f.nodeedge.cn:56987/fsd0c717e3.a.bdydns.com/0/service/cloudapk_sign_online/69000/69265/69265_20240428162519_60031_signed.apk?prodid=2&bcecdn_trace_info=C24sUVlRAhsuDh03YmpjTVI8ZAMVCk1XPxUaECc7JQ9SMR88I1dUF1YINgQRITQ8L1A%3D&f_ver=v1&max_age=7776000&r=GDgySURJFxYqHRMhM3YjBV4oM1ZcBhZaNhlbPDIqNwgTKWlaWxxNXTgEHxAkMSYPLyMoVV4dXRZvTUR%2FZ3d3WEJ6cxYBSgoPbCtGf2VscVVCdHcPBUYJAAZCRH9kaR4SGSsoXFNdWUkySwQ9ODwoBU1%2BHzwjV1QXVgg2BBEhNDwvUA%3D%3D&MqD7sp=l56Ml8Kdm4abkYygmszHyZydm53KyZ2bmc6ZyMyZzM3IzczPz5vOnM3JmZmcyJzLypzNm9mGmZuMj4vCzsjOysvPy8jMzc3Gx9mMnIqWm8KFk5q7x42tm7OQhZump76auKqInNmGmY-NlsLOz8_ZnJOMi5DCzNmLlpKakIqLws7IzsjGxsnIzM3ZnJeanJTCzM3Hy8fMyM7Iy9mNmo6Mj5vCzM_P2YaZkI-LwsrNzg~~&UYs5cp=hpmXkIyLws7NyNHP0c_RztmGmY2ajpabws3Onp2dzZvMxsvKnsjKms-eysidzc6enc_PyJvIxsbP2YaZnp2Mws_ZhpmMlJaPws3Zhpmcm5GQj4vCz9mGmYuWkprCzsjOysvPy8jMzczPyQ~~"
    # 使用curl命令下载apk文件
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

oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes4/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes4/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes4/com/unity3d/player/UnityPlayerActivity.smali

oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes5/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes5/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes5/com/unity3d/player/UnityPlayerActivity.smali

oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes6/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes6/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes6/com/unity3d/player/UnityPlayerActivity.smali

echo "Build Patched Azur Lane apk"
java -jar apktool.jar  -f b AzurLane -o AzurLane.patched.apk

echo "Set Github Release version"

echo "PERSEUS_VERSION=$(echo BaiDu)" >> $GITHUB_ENV

mkdir -p build
mv *.patched.apk ./build/
find . -name "*.apk" -print
