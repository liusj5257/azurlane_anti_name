#!/bin/bash

extract_android_link() {
    curl -s https://line1-h5-pc-api.biligame.com/game/detail/gameinfo?game_base_id=97 |
    grep -o '"android_download_link":"[^"]*' |
    sed 's/"android_download_link":"//'
}



# Download Azur Lane
download_azurlane() {
    if [ ! -f "AzurLane.apk" ]; then
        url=$(extract_android_link)
        echo "下载地址: $url"
        url="https://pkg.biligame.com/games/blhx_9.5.11_0427_1_20250506_095207_d4e3f.apk"

        # 使用强化请求头下载
        if ! curl -L -o "AzurLane.apk" "$url" \
            -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)..." \
            -H "Referer: https://www.bilibili.com/" \
            -H "Accept: text/html,application/xhtml+xml..." \
            -H "Accept-Language: zh-CN,zh;q=0.9" \
            --retry 5 --retry-delay 5; then
            echo "错误: 下载失败，可能是IP被封锁或请求头不足"
            exit 1
        fi
    fi
}

if [ ! -f "AzurLane.apk" ]; then
    # 主流程
    echo "开始获取APK..."
    download_azurlane
    [ -f "AzurLane.apk" ] && echo "APK下载成功！" || echo "下载失败"
fi


echo "Decompile Azur Lane apk"
java -jar apktool.jar  -f d AzurLane.apk

echo "Copy libs"
cp -r libs/. AzurLane/lib/

echo "Patching Azur Lane"
oncreate=$(grep -n -m 1 'onCreate' AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali | sed  's/[0-9]*\:\(.*\)/\1/')
sed -ir "s#\($oncreate\)#.method private static native init(Landroid/content/Context;)V\n.end method\n\n\1#" AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali
sed -ir "s#\($oncreate\)#\1\n    const-string v0, \"Dev_Liu\"\n\n\    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V\n#" AzurLane/smali_classes2/com/unity3d/player/UnityPlayerActivity.smali

echo "Build Patched Azur Lane apk"
java -jar apktool.jar  -f b AzurLane -o AzurLane.patched.apk

echo "Set Github Release version"

echo "PERSEUS_VERSION=$(echo BILIBILI)" >> $GITHUB_ENV

mkdir -p build
mv *.patched.apk ./build/
find . -name "*.apk" -print
