// Event.ets
import { dateToTimestamp } from "./DateProcessing";
// import { AppStorage, PersistentStorage } from '@system.storage';

export interface Event {
  title: string;
  details?: string;
  time?: string; // 时间戳字符串
  position?: string;
  accomplish: boolean;
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
    time: dateToTimestamp(new Date('2025-02-01T09:00:00Z')) // 转换为时间戳字符串
  }
];

// 初始化事件列表时，将 Date 对象转换为时间戳字符串
export function initializeEventList() {
  const eventListJson = JSON.stringify(eventList);
  if (!AppStorage.has('eventList')) {
    // AppStorage.setOrCreate<string>('eventList', eventListJson);
    PersistentStorage.persistProp<string>('eventList', eventListJson);
  }

}

// Event.ets
// ... 其他代码 ...

// 获取事件列表的函数，确保从存储中读取的 JSON 字符串有效
export function getEventListFromStorage(): Event[] {
  const eventListJson: string | undefined = AppStorage.get('eventList');
  // 检查读取的 JSON 字符串是否存在且不为空
  if (typeof eventListJson === 'string' && eventListJson.trim() !== '') {
    try {
      // 尝试解析 JSON 字符串
      return JSON.parse(eventListJson);
    } catch (error) {
      console.error('Failed to parse eventList JSON:', error);
      // 解析失败，可以返回一个空数组或默认事件列表
      return [];
    }
  } else {
    // 如果读取的不是有效的 JSON 字符串，返回空数组或默认事件列表
    return [];
  }
}

// 获取已完成事件列表
export function getAccomplishEventList() {
  let eventList: Event[] = getEventListFromStorage();
  let accomplishEventList: Event[] = eventList.filter((item: Event) => {
    return item.accomplish;
  });
  console.log(JSON.stringify(accomplishEventList));
  return accomplishEventList;
}

// 获取未完成事件列表
export function getUnfinishedEventList() {
  let eventList: Event[] = getEventListFromStorage();
  let unfinishedEventList: Event[] = eventList.filter((item: Event) => {
    return item.accomplish === false;
  });
  console.log(JSON.stringify(unfinishedEventList));
  return unfinishedEventList;
}

// 修改完成状态时，确保时间戳字符串被正确处理
export function changeEventAccomplishState(event: Event) {
  let eventList: Event[] = getEventListFromStorage();
  let indexOfEvent: number = eventList.findIndex((item) => item.title === event.title);

  if (indexOfEvent !== -1) {
    eventList[indexOfEvent].accomplish = !eventList[indexOfEvent].accomplish;
    const eventListJson: string = JSON.stringify(eventList);
    AppStorage.set('eventList', eventListJson);
    // PersistentStorage.persistProp('eventList', eventListJson);
  }
}

// ... 其他代码 ...