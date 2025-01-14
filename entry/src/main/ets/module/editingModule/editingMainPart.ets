import { dateToTimestamp } from '../../util/DateProcessing';
import { Event } from '../../util/Event';

@Entry
@Component
export struct editingMainPart {
  @StorageLink('eventList')
  eventList: Event[] = []
  @State title: string = ''
  @State time: string = ''
  @State details:string = ''

  build() {
    Column({ space: 20 }) {
      Row({ space: 15 }) {
        Text('主题')
          .fontColor(Color.White)
        TextInput({ placeholder: '输入事件的主题', text: $$this.title })
          .backgroundColor(Color.Transparent)
          .fontColor(Color.White)
          .placeholderColor(Color.Gray)
          .layoutWeight(1)
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

      Row({ space: 15 }) {
        Text('时间')
          .fontColor(Color.White)
        DatePicker()
          .layoutWeight(1)
          .onDateChange((selectDate: Date) => {
            this.time = dateToTimestamp(selectDate)
          })
      }
      .padding({ left: 15, top: 10, bottom: 10 })
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)

      Row({ space: 15 }) {
        Text('详情')
          .fontColor(Color.White)
        TextArea({ placeholder: '地点，人物，目标……', text: $$this.details })
          .backgroundColor(Color.Transparent)
          .fontColor(Color.White)
          .placeholderColor(Color.Gray)
          .layoutWeight(1)
          .height(80)
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