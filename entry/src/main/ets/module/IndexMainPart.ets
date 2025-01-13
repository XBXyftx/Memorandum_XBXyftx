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
              .padding({left:10})
              .width('100%')
            }

          })
        }
        ListItemGroup({ header: this.mainPartAccomplishGroupHeader() }) { //已完成组
          ForEach(this.accomplishEventList,(item:Event)=>{
            ListItem(){
              Row(){
                Text(item.title)
                  .fontColor(Color.White)
              }
              .padding({left:10})
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
        .fontSize(25)
        .fontColor(Color.White)
    }
    .borderRadius(10)
    .padding({left:5,bottom:4,top:4})
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
    .padding({left:5,bottom:4,top:4})
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
