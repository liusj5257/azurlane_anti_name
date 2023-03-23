# 将当前路径加入到PATH环境变量中，以便使用Android SDK中的build-tools
#PATH=$PATH:$ANDROID_HOME/build-tools/32.0.0/
# 遍历build目录下的所有apk文件
for f in build/*.apk; do

    # 打印apksigner工具的版本信息
    echo $(apksigner --version)
    # 使用apksigner工具对zipaligned后的apk文件进行签名，使用testkey.pk8和testkey.x509.pem作为密钥和证书
  java -jar "C:\apktool\lib\apksigner.jar"   sign --key testkey.pk8 --cert testkey.x509.pem $f
# 结束循环
done