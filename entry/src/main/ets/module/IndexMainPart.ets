@Component
export struct indexMainPart {
  build() {
    Column(){
      Row(){
        Column(){
          Text('待办事项')
            .fontSize(30)
            .fontColor(Color.White)
            .fontWeight(700)
          Text(`0条代办`)  //待扣洞
            .fontSize(14)
            .fontColor('#ffcfcfcf')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .padding({left:20})
      .justifyContent(FlexAlign.Start)
      .width('100%')


    }
    .width('100%')
    .height('100%')
  }
}