import { Event } from '../../util/Event';
@Entry
@Component
export struct editingMainPart {
  @StorageLink('eventList')
  eventList:Event[]=[]
  @State title:string = ''

  build() {
    Column({space:20}){
      Row({space:15}){
        Text('主题')
          .fontColor(Color.White)
      }
      .padding({left:15,top:18,bottom:18})
      .width('100%')
      .backgroundColor('#c44a4a4a')
      .borderRadius(20)
    }
    .padding({left:10,right:10})
    .width('100%')
  }
}