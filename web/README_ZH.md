#云函数JavaScript CodeLab


## 目录

- [简介](#简介)
- [环境要求](#环境要求)
- [快速入门](#快速入门)
- [授权许可](#授权许可)  


##简介
AppGallery Connect Cloud Function实现无服务器计算。它提供FaaS(Function as a Service)能力，简化应用开发和运维，使您的功能更容易实现，业务能力更快速构建。此演示为您提供了一种将云功能集成到JavaScript 应用程序中的方法。

##准备环境

-一台计算机可以编译运行Vue项目

##快速入门

1、如果您没有华为开发者账号，您需要【注册账号】（https://developer.huawei.com/consumer/en/doc/start/registration-and-verification-000001053628148）并通过身份验证。

2、使用您的帐户登录【AppGalleryConnect】（https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-get-started），创建项目并添加应用，将应用平台设置为Web。

3、在我的项目中选择您的项目和应用，进入“构建>云函数”，开启云函数服务。

4、选择项目设置，进入管理APIs，启用云函数服务。

5.进入常规信息，从AppGallery Connect复制SDK代码段json，并将json粘贴到创建的云函数.vue函数中const **agConnectConfig**的代码段中（）。

6、在演示路径的终端中运行以下代码，演示将启动。

   ```bash
   # install dependencies
    npm install
   
    # run demo
    npm start
   ```

##授权许可

此演示在【Apache许可证，版本2.0】（http://www.apache.org/licenses/LICENSE-2.0）下获得许可。
