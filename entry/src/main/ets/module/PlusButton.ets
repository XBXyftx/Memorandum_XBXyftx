import { router } from "@kit.ArkUI"

@Component
export struct plusButton {
  build() {
    Column(){
      Image($rawfile('plus.svg'))
        .fillColor(Color.Black)
    }
    .borderRadius(999)
    .backgroundColor('#ff21a5fb')
    .onClick(()=>{
      router.pushUrl({
        url:"pages/EditingPage"
      })
    })
  }
}