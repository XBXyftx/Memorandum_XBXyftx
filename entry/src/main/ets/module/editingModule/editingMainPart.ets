import { Event } from '../../util/Event';

@Entry
@Component
export struct editingMainPart {
  @StorageLink('eventList')
  eventList: Event[] = []
  @State title: string = ''
  @State time: string = ''

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

    }
    .padding({ left: 10, right: 10 })
    .width('100%')
  }
}