
真机自己解BL安装Magisk,开启Zygisk,安装模块生效即可


模拟器门槛低一些,不懂加群:796806762

## 修改日志:

**V1.0.4**

* 支持X86模拟器,不需要adb安装X64游戏
* X64版本模拟器容易卡住


**V1.0.3**

* 新增支持4399服
* 自动替换AssetBundles相关UI资源,如果找不到目录会提示手动替换
* 修复对MIUI系统的支持,没生效请重启游戏

假如使用模拟器

需要使用64位版本,并通过 "adb install --abi arm64-v8a XXXX.apk"安装X64碧蓝航线

测试雷电9 雷电5 夜神7 均生效

**V1.0.0**

不修改官方包,没有签名问题

前提ROOT Magisk 开启Zygisk模式

理论支持以下几个包名:

* "com.bilibili.azurlane"
* "com.bilibili.blhx.mi"
* "com.bilibili.blhx.uc"
* "com.tencent.tmgp.bilibili.blhx"
* "com.bilibili.blhx.baidu"
* "com.bilibili.blhx.dl"
* "com.bilibili.blhx.m4399"

只测试了官服
