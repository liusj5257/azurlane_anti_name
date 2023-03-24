# azurlane_anti_name

反和谐船名:μ兵装,小XX,重樱,铁血,白鹰,META

B服 / 9游版/ 当乐/百度

在Releases下载,渠道服自行测试

其他渠道服暂时找不到直链,无能为力.






手动修改的教程如下:（中英混杂）（仅介绍单手机教程）


## 0x1 工具
MT管理器![MT管理器](https://user-images.githubusercontent.com/75507531/227224515-0b86b246-a995-4f65-8c4c-d7c2934ec975.png)
或者np管理器![NP管理器](https://user-images.githubusercontent.com/75507531/227224845-d3be7fe7-05d8-494f-a103-05ecb72a4b7a.png)

## 0x2
下载你的碧蓝航线的的安装包或者使用以上任意一种提取安装包

## 0x3
查看安装包![open](https://user-images.githubusercontent.com/75507531/227228490-ab0d77d1-18ac-4ba8-be91-d7dc2ee8c48b.jpg)

## 0x4
打开classes.dex ![openit](https://user-images.githubusercontent.com/75507531/227229213-af16a4c8-ae32-48e6-bf80-c8c68debbf59.jpg)


## 0x5
在浏览里打开com(文件夹)-->unity3d.player(文件夹)-->UnityPlayerActivity并打开

### 以下通常被认为是一道门槛，希望你能理解它并越过他

# 傻瓜版
## 1x1
在17行粘贴以下内容
```smali

.method private static native init(Landroid/content/Context;)V

.end method

```
## 1x2
在65行粘贴一下内容
```small


const-string v0, "Dev_Liu"

invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

invoke-static {p0}, Lcom/unity3d/player/UnityPlayerActivity;->init(Landroid/content/

```

## 1x3
把仓库里libs文件夹里的三个文件夹复制到apk中lib文件夹里
## 1x4
一路保存并退出

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


## Loading the library
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

