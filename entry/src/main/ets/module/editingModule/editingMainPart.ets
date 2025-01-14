import { Event } from '../../util/Event';
@Entry
@Component
export struct editingMainPart {
  @StorageLink('eventList')
  eventList:Event[]=[]
  build() {
    Column({space:20}){

    }
    .padding({left:10,right:10})
    .width('100%')
  }
}