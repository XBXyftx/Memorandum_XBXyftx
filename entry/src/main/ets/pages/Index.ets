import {plusButton} from '../module/PlusButton'
import {indexMainPart} from '../module/IndexMainPart'
import { Event, eventList, initializeEventList } from '../util/Event';

// import { Event,initializeEventList, } from '../util/Event'

initializeEventList()

// PersistentStorage.persistProp<Event[]>('eventList', eventList);



@Entry
@Component
struct Index {
  build() {
    Stack({alignContent:Alignment.BottomEnd}){
      //下层主体
      indexMainPart()

      //上层加号
      plusButton()
        .width(40)
        .height(40)
        .margin({right:20,bottom:30})
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