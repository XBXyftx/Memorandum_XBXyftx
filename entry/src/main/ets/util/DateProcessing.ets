export function formatDate(date:Date) { //日期转换函数
  const year = date.getFullYear();
  const month = date.getMonth() + 1; // 月份从 0 开始，需要加 1
  const day = date.getDate();
  return `${year}年${month}月${day}日`;
}