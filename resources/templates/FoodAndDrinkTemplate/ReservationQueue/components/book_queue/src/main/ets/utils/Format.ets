export function formatDateToMonthDay(date: Date, index?: number): string {
  if (index === 0) {
    return '今天';
  }
  if (index === 1) {
    return '明天';
  }
  const month = date.getMonth() + 1;
  const day = date.getDate();
  return `${month}月${day}日`;
}

export function formatTimePikerToStr(time: TimePickerResult): string {
  const period = time.hour >= 12 ? '下午' : '上午';
  const hour = time.hour % 12 || 12;
  const hourStr = hour.toString().padStart(2, '0');
  const minuteStr = time.minute.toString().padStart(2, '0');
  return `${period} ${hourStr}:${minuteStr}`;
}

export function formatTimeStrToDate(dateTimeStr: string): Date {
  const parts = dateTimeStr.split(' ');
  const datePart = parts[0];
  const period = parts[1];
  const timePart = parts[2];
  const monthDayParts = datePart.split(/[月日]/);
  const monthStr = monthDayParts[0];
  const dayStr = monthDayParts[1];
  const timeParts = timePart.split(':');
  const hourStr = timeParts[0];
  const minuteStr = timeParts[1];
  let month = parseInt(monthStr, 10) - 1;
  const day = parseInt(dayStr, 10);
  let hour = parseInt(hourStr, 10);
  const minute = parseInt(minuteStr, 10);
  if (period === '下午' && hour !== 12) {
    hour += 12;
  } else if (period === '上午' && hour === 12) {
    hour = 0;
  }
  const now = new Date();
  const year = now.getFullYear();
  const date = new Date();
  date.setFullYear(year, month, day);
  date.setHours(hour, minute, 0, 0);
  return date;
}

export function formatDateToTimeStr(date: Date): string {
  const month = date.getMonth() + 1;
  const day = date.getDate();
  let hour = date.getHours();
  const minute = date.getMinutes();
  const period = hour >= 12 ? '下午' : '上午';
  hour = hour % 12;
  hour = hour === 0 ? 12 : hour;
  return `${month}月${day}日 ${period} ${hour.toString().padStart(2, '0')}:${minute.toString().padStart(2, '0')}`;
}

export function formatDistance(distanceInMeters: number): string {
  if (distanceInMeters < 1000) {
    return `${Math.floor(distanceInMeters)}m`;
  }
  const distanceInKilometers = (distanceInMeters / 1000).toFixed(2);
  return `${distanceInKilometers}km`;
}

export function formatPhoneNumber(phoneNum: string) {
  if (phoneNum.length === 11) {
    return phoneNum.slice(0, 3) + '****' + phoneNum.slice(7);
  }
  return phoneNum;
}