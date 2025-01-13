import { it } from "@ohos/hypium"
import { Event, getAccomplishEventList, getUnfinishedEventList } from "../util/Event"

@Component
export struct indexMainPart {
  @StorageLink('eventList') eventList: Event[] = []
  @State unfinishedEventList: Event[] = getUnfinishedEventList()
  @State accomplishEventList: Event[] = getAccomplishEventList()

  build() {
    Column() {
      mainPartHeader(this.eventList.length)

      List() {
        ListItemGroup({ header: this.mainPartUnfinishedGroupHeader() }) { //未完成组
          ForEach(this.unfinishedEventList,(item:Event)=>{
            ListItem(){
              Row(){
                Text(item.title)
                  .fontColor(Color.White)
              }
              .width('100%')
            }

          })
        }
      }
      .padding(10)
      .sticky(StickyStyle.Header)
      // .backgroundColor(Color.White)
      .width('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
  }

  @Builder
  mainPartUnfinishedGroupHeader() {
    Row() {
      Text('未完成事项')
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
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
