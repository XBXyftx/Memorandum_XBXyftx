@Component
export struct indexMainPart {
  build() {
    Column(){
      mainPartHeader(0)


    }
    .width('100%')
    .height('100%')
  }
}

@Builder
function mainPartHeader(eventNum:number) {
  Row() {
    Column() {
      Text('待办事项')
        .fontSize(30)
        .fontColor(Color.White)
        .fontWeight(700);
      Text(`${eventNum}条代办`)
        .fontSize(14)
        .fontColor('#ffcfcfcf');
    }
    .alignItems(HorizontalAlign.Start);
  }
  .padding({ left: 20 })
  .justifyContent(FlexAlign.Start)
  .width('100%')
}
