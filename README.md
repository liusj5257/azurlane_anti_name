# azurlane_anti_name

# 功能
碧蓝航线反和谐:过场图随机12张,皮肤,特触,敌我船名,誓约之戒
# 使用方法
* 不需要改data文件下的true,假如第一次安装使用,请先卸载官方安装包后重新安装,重下一遍数据包

* UI资源相关
AssetBundles文件夹直接复制粘贴游戏目录/Android/data/com.bilibili.blhx/files,如果提示是否覆盖说明路径正确
AssetBundleExtractor可以编辑UI资源
AssetStudio可以查看UI资源


# [下载apk点我](https://github.com/liusj5257/azurlane_anti_name/releases)
  apk:B服 / 9游版 / 当乐 /百度 / 小米 /应用宝
# [修改效果](https://www.bilibili.com/video/BV1iN411K7tt)

# [Magisk_Zygisk 模块](https://github.com/liusj5257/azurlane_anti_name/blob/master/Zygisk.md)


# 常见问题
1.无法登陆:请用帐号密码登陆,由于修改过apk,签名校验不一致,无法使用其他应用的快捷登陆方式

2.无法充值:使用支付宝,或者登陆网易云等云游戏平台充值

3.戒指等UI资源没变: **看看使用方法不会死**


# 手动打包的教程如下:（中英混杂）（仅介绍单手机教程）


## 0x1 工具
MT管理器 <img src="https://user-images.githubusercontent.com/75507531/227224515-0b86b246-a995-4f65-8c4c-d7c2934ec975.png" width="55">
或者np管理器<img src="https://user-images.githubusercontent.com/75507531/227224845-d3be7fe7-05d8-494f-a103-05ecb72a4b7a.png" width="55">

## 0x2
下载你的碧蓝航线的的安装包或者使用以上任意一种提取安装包

## 0x3
查看安装包

<img src="https://user-images.githubusercontent.com/75507531/227228490-ab0d77d1-18ac-4ba8-be91-d7dc2ee8c48b.jpg" width="450">

## 0x4
打开classes.dex,假如有多个classes2.dex,classes3.dex,可以一起打开,UnityPlayerActivity的位置不固定

<img src="https://user-images.githubusercontent.com/75507531/227229213-af16a4c8-ae32-48e6-bf80-c8c68debbf59.jpg" width="450">


## 0x5
在浏览里打开com(文件夹)-->unity3d.player(文件夹)-->UnityPlayerActivity并打开


# MT教程
## 1x1
在与图片类似的位置粘贴下面代码

<img width="450" alt="1" src="https://user-images.githubusercontent.com/87109954/233051748-04a445fd-c719-404d-b914-1394d3b91fa2.png">


```smali

.method private static native init(Landroid/content/Context;)V

.end method

```
## 1x2
在与图片类似的位置粘贴下面代码

<img width="450" alt="2" src="https://user-images.githubusercontent.com/87109954/233051967-65b4c090-0042-451f-94c1-8d75de5304ca.png">

```small

    const-string v0, "Dev_Liu"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V

```

## 1x3

把仓库里[libs文件夹](https://github.com/liusj5257/azurlane_anti_name/tree/master/libs)里的三个文件夹复制到apk中lib文件夹里

## 1x4

一路保存并退出,别忘记勾选自动签名

## 1x5
卸载碧蓝航线，安装修改后的apk文件
（你可以选择重新下7G或者先把``/sdcard/Android/data/(你的碧蓝航线包名)``包名一般包括<bilibili> <blhx> <azurline> 改一个名字，等重装完碧蓝航线再替换回原名字）

## 原版教程
##1x0：Loading the library
Add the following method to `UnityPlayerActivity`, anywhere above its `onCreate`:
```smali
.method private static native init(Landroid/content/Context;)V
.end method
```

And these lines to `onCreate`:
```smali
    const-string v0, "Dev_Liu"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/Context;)V
```
(Preferably without replacing other variables, such as between `.locals 2` and `const/4 v0, 0x1`.)


## Credits
* https://github.com/adamyaxley/Obfuscate.
* https://github.com/Rprop/And64InlineHook.
* https://github.com/joeyjurjens/Android-Hooking-Template.
* https://github.com/n0k0m3/Azur-Lane-Scripts-Autopatcher.
* https://github.com/Perfare/Zygisk-Il2CppDumper
* https://github.com/jmpews/Dobby
* https://github.com/hexhacking/xDL

