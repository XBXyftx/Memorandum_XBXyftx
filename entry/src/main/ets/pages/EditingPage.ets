import { editingMainPart } from '../module/editingModule/editingMainPart'

@Entry
@Component
struct EditingPage {
  build() {
    Column(){
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