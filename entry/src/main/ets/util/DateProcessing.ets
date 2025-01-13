// 日期转换函数，接受时间戳字符串作为参数
export function formatDate(timestamp: string): string {
  const date = timestampToDate(timestamp); // 将时间戳字符串转换为 Date 对象
  const year = date.getFullYear();
  const month = date.getMonth() + 1; // 月份从 0 开始，需要加 1
  const day = date.getDate();
  return `${year}年${month}月${day}日`;
}

// 将 Date 对象转换为时间戳字符串
export function dateToTimestamp(date: Date): string {
  return date.toISOString();
}

// 将时间戳字符串转换回 Date 对象
export function timestampToDate(timestamp: string): Date {
  return new Date(timestamp);
}

