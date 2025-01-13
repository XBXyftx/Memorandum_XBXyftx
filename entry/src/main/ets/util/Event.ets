import { dateToTimestamp } from "./DateProcessing";

export interface Event {
  title: string | null;
  details?: string | null;
  time?: string; // 时间戳字符串
  position?: string | null;
  accomplish: boolean | null;
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
    time: new Date('2025-02-01T09:00:00Z').toISOString() // 转换为时间戳字符串
  }
];


// 初始化事件列表时，将 Date 对象转换为时间戳字符串
export function initializeEventList() {
  const eventListWithTimestamps = eventList.map((event) => {
    if (event.time) {
      event.time = dateToTimestamp(new Date(event.time));
    }
    return event;
  });
  AppStorage.setOrCreate<Event[]>('eventList', eventListWithTimestamps);
  PersistentStorage.persistProp<Event[]>('eventList',[]);
}

// 获取已完成事件列表
export function getAccomplishEventList() {
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList');
  let accomplishEventList: Event[] = eventListOriginalLink.get().filter((item: Event) => {
    return item.accomplish;
  });
  console.log(JSON.stringify(accomplishEventList));
  return accomplishEventList;
}

// 获取未完成事件列表
export function getUnfinishedEventList() {
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList');
  let unfinishedEventList: Event[] = eventListOriginalLink.get().filter((item: Event) => {
    return item.accomplish === false;
  });
  console.log(JSON.stringify(unfinishedEventList));
  return unfinishedEventList;
}

// 修改完成状态时，确保时间戳字符串被正确处理
export function changeEventAccomplishState(event: Event) {
  let eventListOriginalLink: SubscribedAbstractProperty<Event[]> = AppStorage.link('eventList');
  let eventList: Event[] = eventListOriginalLink.get();
  let indexOfEvent: number = eventList.findIndex((item) => item.title === event.title);

  if (indexOfEvent !== -1) {
    eventList[indexOfEvent].accomplish = !eventList[indexOfEvent].accomplish;
    AppStorage.set('eventList', eventList);
    PersistentStorage.persistProp('eventList', eventList);
  }
}

