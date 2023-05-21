
真机解锁BL安装Magisk,开启Zygisk,安装模块生效即可

模拟器门槛低一些:[视频教程](https://www.bilibili.com/video/BV1CT411t7vH)

**夜神7/逍遥7_32/蓝叠P** 测试生效

**逍遥7_64/逍遥9/雷电7_9**无法调用X86模块,只能用1.0.5及以前的旧方案了,使用ADB命令安装X64游戏,调用X64模块

## 修改日志:

**v1.0.6**

* 修改X64模拟器调用X86模块,**此版本后无需使用ADB强行安装X64版本的游戏**

**V1.0.5**

* 支持X86逍遥模拟器

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
