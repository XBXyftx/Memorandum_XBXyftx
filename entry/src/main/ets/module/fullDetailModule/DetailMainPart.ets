import { formatDate } from '../../util/DateProcessing'
import { Event, getEventListFromStorage } from '../../util/Event'
@Component
export struct DetailMainPart {
  @Prop eventToShow: Event
  build() {
    Column({ space: 20 }) {
      Row({ space: 15 }) {
        Text('主题')
          .fontColor(Color.White)
        Text(this.eventToShow.title)
          .fontColor(Color.White)
          .layoutWeight(1)
          .textAlign(TextAlign.Start)
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

      Row({ space: 15 }) {
        Text('时间')
          .fontColor(Color.White)
        if (this.eventToShow.time){
          Text(formatDate(this.eventToShow.time))
            .fontColor(Color.White)
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }else {
          Text('无截止时间')
        }
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

      Row({ space: 15 }) {
        Text('详情')
          .fontColor(Color.White)
        if (this.eventToShow.details){
          Text(this.eventToShow.details)
            .fontColor(Color.White)
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }else {
          Text('无详细信息')
        }
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

      Row({ space: 15 }) {
        Text('状态')
          .fontColor(Color.White)
        Text(this.eventToShow.accomplish?'已完成':'未完成')
          .fontColor(Color.White)
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

    }
    .padding({ left: 10, right: 10 })
    .width('100%')
  }
}