import { Event, getAccomplishEventList, getUnfinishedEventList } from "../util/Event"

@Component
export struct indexMainPart {
  @StorageLink('eventList') eventList: Event[] = []

  build() {
    Column() {
      mainPartHeader(this.eventList.length)

      List() {
        ListItemGroup() {

        }
      }
      // .backgroundColor(Color.White)
      .width('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
  }
}

@Builder
function mainPartHeader(eventNum: number) {
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
