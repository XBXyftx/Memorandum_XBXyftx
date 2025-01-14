import { router } from '@kit.ArkUI'
import { DetailMainPart } from '../module/fullDetailModule/DetailMainPart'
import { Event } from '../util/Event'


@Entry
@Component
struct FullDetailPage {
  @State eventIndex: Event = {title:'',accomplish:false}

  aboutToAppear(): void {
    this.eventIndex = router.getParams() as Event
  }

  build() {
    Column({space:30}) {
      Row(){
        Image($rawfile('back.svg'))
          .width(40)
      }
      .padding({left:10})
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .onClick(()=>{
        router.back()
      })

      DetailMainPart({
        eventToShow:this.eventIndex
      })
    }
    .linearGradient({
      direction: GradientDirection.LeftBottom,
      colors: [['#ff020db7', 0], ['#ff00030a', 1]]
    })
    .expandSafeArea()
    .height('100%')
    .width('100%')
  }
}