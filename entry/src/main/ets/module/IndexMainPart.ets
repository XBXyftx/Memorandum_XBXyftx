import { formatDate } from "../util/DateProcessing"
import { Event, getAccomplishEventList, getUnfinishedEventList, changeEventAccomplishState,
  deleteEvent } from "../util/Event"

@Component
export struct indexMainPart {
  // @StorageLink('eventList') eventList: Event[] = []
  @State unfinishedEventList: Event[] = getUnfinishedEventList()
  @State accomplishEventList: Event[] = getAccomplishEventList()

  reloadList() {
    this.unfinishedEventList = getUnfinishedEventList()
    this.accomplishEventList = getAccomplishEventList()
  }

  build() {
    Column() {
      mainPartHeader(this.unfinishedEventList.length + this.accomplishEventList.length)

      List({ space: 20 }) {
        ListItemGroup({ header: this.mainPartUnfinishedGroupHeader(), space: 10 }) { //未完成组
          ForEach(this.unfinishedEventList, (item: Event, i) => {
            ListItem() {
              this.eventListItem(item, i)
            }
            .swipeAction({
              end: {
                builder: this.unfinishedEventListItemEnd(item)
              }
            })

          })
        }

        ListItemGroup({ header: this.mainPartAccomplishGroupHeader(), space: 10 }) { //已完成组
          ForEach(this.accomplishEventList, (item: Event, i) => {
            ListItem() {
              this.eventListItem(item, i)
            }
            .swipeAction({
              end: {
                builder: this.accomplishEventListItemEnd(item)
              }
            })
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
  unfinishedEventListItemEnd(item: Event) { //未完成
    Row({ space: 20 }) {
      Column() {
        Image($rawfile('ic_public_ok_filled.svg'))//标记为完成
          .height('100%')
          .fillColor(Color.White)
      }
      .borderRadius(999)
      .backgroundColor(Color.Green)
      .height(28)
      .onClick(() => {
        changeEventAccomplishState(item) //修改完成状态
        // this.eventList.push({ title: '交作业8', accomplish: false })
        this.reloadList() //重新加载页面
      })

      Column() {
        Image($rawfile('ic_public_delete_filled.svg'))//删除
          .height('100%')

      }
      .borderRadius(999)
      .backgroundColor(Color.Red)
      .height(28)
    }
    .height('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: 25, right: 25 })
  }

  @Builder
  accomplishEventListItemEnd(item: Event) { //完成
    Row({ space: 20 }) {
      Column() {
        Image($rawfile('ic_public_cancel_filled.svg'))//标记为未完成
          .height('100%')
          .fillColor(Color.White)
      }
      .borderRadius(999)
      .backgroundColor(Color.Green)
      .height(28)
      .onClick(() => {
        changeEventAccomplishState(item) //修改完成状态
        this.reloadList() //重新加载页面
      })

      Column() {
        Image($rawfile('ic_public_delete_filled.svg'))//删除
          .height('100%')

      }
      .borderRadius(999)
      .backgroundColor(Color.Red)
      .height(28)
      .onClick(() => {
        deleteEvent(item)
        this.reloadList()
      })
    }
    .height('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: 25, right: 25 })
  }

  @Builder
  eventListItem(item: Event, index: number) {
    Row() {
      Column({ space: 6 }) {
        Text(item.title)
          .fontColor(item.accomplish ? Color.Gray : Color.White)
          .fontSize(16)
          .decoration({
            type: item.accomplish ? TextDecorationType.LineThrough : TextDecorationType.None,
            color: '#ffb90000',
            style: TextDecorationStyle.DOUBLE
          })
        if (item.time) { // 确保 item.time 是一个时间戳字符串
          Text(formatDate(item.time))
            .fontColor(item.accomplish ? Color.Gray : Color.White)
            .fontSize(16)
        }
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)
      .constraintSize({ minHeight: 25 })
    }
    .backgroundColor('#8a4a4a4a')
    .margin({ top: index === 0 ? 10 : 0 })
    .padding({ left: 10, top: 8, bottom: 8 })
    .borderRadius(10)
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
