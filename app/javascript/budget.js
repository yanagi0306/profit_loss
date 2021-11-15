const JapaneseHolidays = require("japanese-holidays");
var today = new Date();
var holiday = JapaneseHolidays.isHoliday(today);
if (holiday) {
  console.log("今日は " + holiday + " です");
} else {
  console.log("今日は祝日ではありません");
}
