/*
 * Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Logger, Preferences } from "@hw-agconnect/base-ohos"
import "@hw-agconnect/core-ohos";
import "@hw-agconnect/function-ohos"
import "@hw-agconnect/credential-ohos";

import http from '@ohos.net.http';

const TAG = "AGC_FUNCTION_CODELAB"
let func = globalThis.func;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State input: string=''
  @State result: string=''

  build() {
    Row() {
      Column() {
        Text(this.result).width('50%').margin({ top: 20 }).onClick((event) => {
          this.result = '';
        })
        TextInput({ placeholder: 'input your year' })
          .width('50%')
          .margin({ top: 20 })
          .onChange((value: string) => {
            this.input = value;
          })
        Button("run")
          .width('50%')
          .margin({ top: 20 })
          .onClick(() => {
            try{
              let callableFunc = func.wrap('symbolic-animal-$latest');

              let param = {"year":this.input}
              callableFunc.call(param).then((res) => {
                Logger.info(TAG, 'function called succuess你' + JSON.stringify(res));
                this.result = JSON.stringify(res.getValue());
              }).catch((error) => {
                this.result = 'err ' + JSON.stringify(error);
                Logger.error(TAG, 'function called err:' + JSON.stringify(error));
              })
            } catch(e){
              Logger.error(TAG, 'run err:' + JSON.stringify(e));
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}