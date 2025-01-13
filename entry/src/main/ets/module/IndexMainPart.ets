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

      List({ space: 20 }) {
        ListItemGroup({ header: this.mainPartUnfinishedGroupHeader(), space: 10 }) { //未完成组
          ForEach(this.unfinishedEventList, (item: Event, i) => {
            ListItem() {
              this.eventListItem(item, i)
            }

          })
        }

        ListItemGroup({ header: this.mainPartAccomplishGroupHeader(), space: 10 }) { //已完成组
          ForEach(this.accomplishEventList, (item: Event, i) => {
            ListItem() {
              this.eventListItem(item, i)
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
  eventListItem(item: Event, index: number) {
    Row() {
      Column(){
        Text(item.title)
          .fontColor(Color.White)
        Text(`2024`)
      }

    }
    .backgroundColor('#ccc')
    .margin({ top: index === 0 ? 10 : 0 })
    .padding({ left: 10 })
    .width('100%')
  }

  @Builder
  mainPartUnfinishedGroupHeader() {
    Row() {
      Text('未完成事项')
        .fontSize(25)
        .fontColor(Color.White)
    }
    .borderRadius(10)
    .padding({ left: 5, bottom: 4, top: 4 })
    .backgroundColor('#865b5b5b')
    .justifyContent(FlexAlign.Start)
    .width('100%')
  }

  @Builder
  mainPartAccomplishGroupHeader() {
    Row() {
      Text('已完成事项')
        .fontSize(25)
        .fontColor(Color.White)
    }
    .borderRadius(10)
    .padding({ left: 5, bottom: 4, top: 4 })
    .backgroundColor('#865b5b5b')
    .justifyContent(FlexAlign.Start)
    .width('100%')
  }
}

@Builder
function mainPartHeader(eventNum: number) {
  Row() {
    Column() {
      Text('待办事项')
        .fontSize(35)
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
