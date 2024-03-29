/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

const $ = (x) => document.getElementById(x);

document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
  $('callFunctionResult').innerHTML = "callFunctionResult:";
  $('callFunctionWithParamResult').innerHTML = "callFunctionWithParamResult:";
  console.log("onDeviceReady");
}

$("call").onclick = () => {
  AGCCloudFunctions.call("add-$latest")
    .then((callFunctionResult) => {
      let callFunctionResultJSON = JSON.parse(callFunctionResult);
      console.log("call -> Success : " + JSON.stringify(callFunctionResultJSON, null, 1));
      $("callFunctionResult").innerHTML = JSON.stringify(
        callFunctionResultJSON,
        null,
        1
      );
    })
    .catch(function (err) {
      alert("call -> Error1 : " + err);
    });
};

$("callWithParam").onclick = () => {
  const params1 = {
    number1: 12,
    number2: 11,
  };
  const options = {
    timeout: 10,
    timeUnit: AGCCloudFunctions.AGCTimeUnit.SECONDS,
    params: params1,
  };
  AGCCloudFunctions.call("add-$latest", options)
    .then((callFunctionWithParamResult) => {
      let callFunctionWithParamResultJSON = JSON.parse(callFunctionWithParamResult);
      console.log("callWithParam -> Success : " + JSON.stringify(callFunctionWithParamResultJSON, null, 1));
      $("callFunctionWithParamResult").innerHTML = JSON.stringify(
        callFunctionWithParamResultJSON,
        null,
        1
      );
    })
    .catch(function (err) {
      alert("callFunctionWithParamResult -> Error : " + err);
    });
};
