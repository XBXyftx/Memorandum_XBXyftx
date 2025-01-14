import { Event } from '../util/Event';
@Entry
@Component
struct EditingPage {
  @StorageLink('eventList')
  eventList:Event[]=[]

  build() {
    Column(){

    }
    .linearGradient({
      direction:GradientDirection.LeftBottom,
      colors:[['#ff020db7',0],['#ff00030a',1]]
    })
    .expandSafeArea()
    .height('100%')
    .width('100%')
  }
}