import { editingMainPart } from '../module/editingModule/editingMainPart'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct EditingPage {
  build() {
    Column({space:20}){
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

      editingMainPart()
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