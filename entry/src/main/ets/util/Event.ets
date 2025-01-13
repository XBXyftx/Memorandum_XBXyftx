export interface Event{
  title:string|null
  details?:string|null
  time?:Date|null
  position?:string|null
  accomplish:boolean|null
}

export let eventList:Event[] = [
  {title:'交作业1',accomplish:false},
  {title:'交作业2',accomplish:false},
  {title:'交作业3',accomplish:false},
  {title:'交作业4',accomplish:false},
  {title:'交作业5',accomplish:false},
  {title:'交作业6',accomplish:false},
]

export function getAccomplishEventList(){
  let eventListOriginalLink:SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList')
  let accomplishEventList:Event[]=eventListOriginalLink.get().filter(()=>{

  })
}