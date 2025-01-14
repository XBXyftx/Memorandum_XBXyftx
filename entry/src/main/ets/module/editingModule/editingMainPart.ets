import { dateToTimestamp } from '../../util/DateProcessing';
import { addEvent, Event } from '../../util/Event';
import { router } from '@kit.ArkUI';

@Component
export struct editingMainPart {
  @StorageLink('eventList')
  eventList: Event[] = []
  @State title: string = ''
  @State time: string = ''
  @State details: string = ''


  clean() {
    this.title = '';
    this.time = '';
    this.details = '';
  }

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

      Button('创建事件')
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [
            ['#ffffffff', 0],
            ['#ff0820fc', 0.3],
            ['#ffac00ac', 1]
          ]
        })
        .width('100%')
        .stateStyles({
          pressed: {
            .linearGradient({
              direction: GradientDirection.RightBottom,
              colors: [
                ['#ffffffff', 0],
                ['#ff0820fc', 0.5],
                ['#ffff01ff', 1]
              ]
            })
          }
        })
        .onClick(()=>{
          addEvent({
            title: this.title,
            time: this.time,
            details: this.details,
            accomplish: false
          })
          router.back()
        })
    }
    .padding({ left: 10, right: 10 })
    .width('100%')
  }
}