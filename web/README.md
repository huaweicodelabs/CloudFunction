# Cloud function JavaScript CodeLab


## Directory

- [Intro] (#Intro)
- [Environmental Requirements] (#Environmental Requirements)
- [Quick Start] (#Quick Start)
- [License] (#License)


## Introduction
AppGallery Connect Cloud Function enables serverless computing. It provides the Function as a Service (FaaS) capability to simplify application development and O&M, making it easier for you to implement functions and quickly build service capabilities. This demo provides you with a way to integrate cloud capabilities into your JavaScript application.

## Prepare the environment.

- One computer can compile and run the Vue project

## Quick Start

1. If you do not have a Huawei Developer account, you need to register an account with (https://developer.huawei.com/consumer/en/doc/start/registration-and-verification-000001053628148) and pass the authentication.

2. Log in to [AppGalleryConnect] (https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-get-started) using your account, create a project, add an application, and set the application platform to Web.

3. On the My Projects page, select your project and application, choose Build > Functions, and enable FunctionGraph.

4. Choose Project Settings > Manage APIs and enable FunctionGraph.

5. Go to the general information page, copy the SDK code segment json from AppGallery Connect, and paste the json to the code segment of const **agConnectConfig** in the created cloud function.vue ().

6. Run the following code in the terminal of the demo path and the demo will start.

```bash
# install dependencies
npm install

# run demo
npm start
` ` `

## License

This demo is licensed under the [Apache License, Version 2.0] (http://www.apache.org/licenses/LICENSE-2.0).