# AGC云函数Cordova 演示

##目录

- [1.导言]（#1-导言）
- [2.安装指南]（#2-安装指南）
- [2.1.在AppGallery Connect中创建项目]（#21-创建项目-appGallery-connect）
- [2.2.获取agconnect-services.json和agconnect-services.plist]（#22-获取-agconnect-servicesjson-and-agconnect-servicessplist）
- [2.3.申请云函数服务]（#23-申请云函数服务）
- [2.4.启用云功能服务]（#24启用-云功能-服务）
- [2.5.创建云函数]（#25-创建云函数）
- [2.6.Cordova ]（#26-Cordova ）
-【2.6.1.iOS应用开发】（#261-ios-app-开发）
-[2.6.2.Android应用开发]（#262-android-app-开发）
- [3.方法定义]（#3-方法定义）
- [4.配置和说明]（#4-配置和说明）
- [5.许可和条款]（#5-许可和条款）

---

## 1.导言

此演示应用程序演示了AGC云函数Cordova 插件的使用。

---

## 2.安装指南

在开始之前，您必须注册为华为开发者联盟，并在【HUAWEI开发者联盟】网站（https://developer.huawei.com/consumer/en/）上完成身份验证。具体操作请参见【注册华为帐号】(https://developer.huawei.com/consumer/en/doc/10104)。

### 2.1.在AppGallery Connect中创建项目

需要在AppGallery Connect中创建应用，才能与华为服务通信。要创建应用，请执行以下步骤：

1、登录【AppGallery Connect】(https://developer.huawei.com/consumer/en/service/josp/agc/index.html)，选择**我的项目**。
2.从项目列表中选择您的项目，或通过单击**添加项目**按钮创建新的项目。
3、进入**项目设置**>**一般信息**，单击**添加应用**。
如果项目中存在应用，需要添加新的应用，请展开页面顶部的应用选择区域，单击**添加应用**。
4、在**添加应用**页面，输入应用信息，单击**确定**。

### 2.2.获取agconnect-services.json和agconnect-services.plist

1、登录【应用市场连接】（https://developer.huawei.com/consumer/en/service/josp/agc/index.html），在**我的项目**中选择您的项目。然后转到**项目设置**>**一般信息**。在**应用信息**字段中，

-如果平台是Android，请单击**agconnect-services.json**按钮下载配置文件。
-如果平台为iOS，请单击**agconnect-services.plist**按钮下载配置文件。

### 2.3.申请云函数服务

云函数仍处于测试状态。如需使用云功能，请发送申请邮件至agconnect@huawei.com申请服务。

请按照以下格式设置邮件标题：【云功能】-【公司名称】-【开发者账号ID】-【项目ID】。查询开发者账号ID和项目ID的具体操作请参见【查询开发者账号ID和项目ID】(https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-query-ID)。

华为运营人员将在1-3个工作日内回复。

>此电子邮件地址仅用于处理AppGallery Connect服务发放申请。请勿向此电子邮件地址发送其他咨询。

### 2.4.启用云函数服务

1、在【应用市场连接】（https://developer.huawei.com/consumer/en/service/josp/agc/index.html）中，找到您的项目，单击您要使用云函数的应用。

2.在左侧菜单中选择**构建**和**云函数**，然后单击**启用云函数服务**。

### 2.5.创建云函数

创建云函数请参见【创建函数】(https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-cloudfunction-getstarted#h1-1592364963757)。

**创建触发器：**要调用应用程序中的函数，必须创建HTTP触发器。具体操作请参见【创建HTTP触发器】(https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-cloudfunction-triggercall#h2-1603096955823)。在应用中调用函数时，必须传递HTTP触发器的标识符。具体操作请参见【查询触发器标识符】(https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-cloudfunction-appcall#h1-1578361186845)


2.6.Cordova

1、安装Cordova CLI。

   ```bash
   npm install -g cordova
   ```

2.创建新的Cordova项目或使用现有的Cordova项目。

-要创建新的Cordova项目，您可以使用**`Cordova创建路径【id【名称【配置】】】【选项】`**命令。有关更多详细信息，请访问【CLI参考- Apache Cordova】(https://cordova.apache.org/docs/en/latest/reference/cordova-cli/index.html#cordova-create-command)。

3.更新**`config.xml`**文件中指定的小部件**`id`**属性。它必须与**`agconnect-services.json`**和**`agconnect-services.plist`**文件的**client > package_name**值相同。

4.更新**`<项目_root>/www/js/index.js`**文件中指定的'<set_triggerIdentifier>'参数。

5.在Cordova 项目config.xml中检查首选项。

“xml”
<!--平台iOS-->
<<preference ="deployment-target"value="11.0" />
<<preference ="SwiftVersion"value="5"/>
```

6.如果以前没有将**Android**或**iOS**平台添加到项目中。


   ```bash
   cordova platform add android
   ```

   ```bash
   cordova platform add ios
   ```

7.在项目中安装`AGC云函数Cordova 插件`。

-在项目根目录下运行以下命令，通过**npm**安装。

```bash
cordova plugin add @cordova-plugin-agconnect/cloudfunctions
```

#### 2.6.1. iOS应用开发

1.将**`agconnect-services.plist`**文件添加到Xcode项目的应用程序根目录中。

2.运行应用程序。

```bash
cordova run ios --device
```

####2.6.2.Android应用开发

1.将**`agconnect-services.json`**文件复制到**`<project_root>/platforms/android/app`**目录下。

2.运行应用程序。

   ```bash
   cordova run android --device
   ```

---

## 3.方法定义

####公共方法总结

|方法|返回类型|描述|
| --------------- | ----------- | ------------------------------------------ |
|call()|`void`|调用没有输入参数的函数。|
| callWithParam() | `void` |调用带有输入参数的函数。|

---

## 4.配置和说明

不。

---

## 6.许可和条款

AGC云功能Cordova 插件在【Apache 2.0许可证】（许可证）下获得许可。