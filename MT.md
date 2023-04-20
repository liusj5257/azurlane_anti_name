
# 手动打包的教程如下:（仅介绍单手机教程）


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
