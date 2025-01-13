export interface Event {
  title: string | null
  details?: string | null
  time?: Date | null
  position?: string | null
  accomplish: boolean | null
}

export let eventList: Event[] = [
  { title: '交作业1', accomplish: false },
  { title: '交作业2', accomplish: false },
  { title: '交作业3', accomplish: false },
  { title: '交作业4', accomplish: true },
  { title: '交作业5', accomplish: true },
  { title: '交作业6', accomplish: false },
  {
    title: '交作业7',
    accomplish: false,
    time: new Date('2025-02-01T09:00:00Z')
  }
]

export function getAccomplishEventList() {
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList') //获取AppStorage中的事件列表link
  let accomplishEventList: Event[] = eventListOriginalLink.get().filter((item: Event) => { //筛选出已经完成的
    return item.accomplish
  })
  console.log(JSON.stringify(accomplishEventList))
  return accomplishEventList
}

export function getUnfinishedEventList() {
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList') //获取AppStorage中的事件列表link
  let unfinishedEventList: Event[] = eventListOriginalLink.get().filter((item: Event) => { //筛选出未完成的
    return item.accomplish === false
  })
  console.log(JSON.stringify(unfinishedEventList))
  return unfinishedEventList
}

export function setAccomplishEvent(event: Event) { //传入事件修改其完成状态
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList') //获取AppStorage中的事件列表link
  let indexOfEvent: number = eventListOriginalLink.get().indexOf(event) //获取待修改对象的下标
  event.accomplish=!event.accomplish
  eventListOriginalLink.get().splice(indexOfEvent,1,event)
}