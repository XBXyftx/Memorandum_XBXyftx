import {plusButton} from '../module/IndexModule/PlusButton'
import {indexMainPart} from '../module/IndexModule/IndexMainPart'
import { initializeEventList } from '../util/Event';

@Entry
@Component
struct Index {

  aboutToAppear(): void {
    initializeEventList()
    this.linkNum++
  }

  onPageShow(): void {
    this.linkNum++
  }
  @State linkNum:number = 1

  build() {
    Stack({alignContent:Alignment.BottomEnd}){
      //下层主体
      indexMainPart({linkNum:this.linkNum})

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