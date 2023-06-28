import agconnect from '@hw-agconnect/api-ohos';
import "@hw-agconnect/core-ohos";
import "@hw-agconnect/function-ohos";
import { Logger, Preferences } from "@hw-agconnect/base-ohos"

@Entry
@Component
struct Functions {
  @State year : string = '';
  @State functionResult: string = '';
  build() {
    Column() {
      TextInput({placeholder:"输入年份"})
        .width('90%')
        .onChange((value: string) => {
          this.year = value;
        })

      Button('查询', {type: ButtonType.Capsule, stateEffect: true})
        .margin({ top: '100px', bottom: '100px'})
        .width('90%')
        .onClick(() => {
          this.callFunction();
        })

      Text("生肖: " + this.functionResult)
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .padding(10)
        .width('90%')

    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  callFunction() {
    agconnect.instance().init(getContext(this));
    let functionCallable = agconnect.function().wrap("cloudfunction-$latest");
    let params = {"year" : this.year};
    functionCallable.call(params).then((ret: any) => {
      this.functionResult = ret.getValue().result;
      Logger.info("Functions", "Cloud Function Called, Returned Value: " + JSON.stringify(ret.getValue()));
    }).catch((error: any) => {
      Logger.error("Functions", "Error - could not obtain cloud function result. Error Detail: " + JSON.stringify(error));
    });
  }
}