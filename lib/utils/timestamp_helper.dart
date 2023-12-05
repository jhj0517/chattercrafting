import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

String timestampIntoDateFormat(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  DateFormat dateFormat = DateFormat('EEEE, MMMM d, yyyy');
  return dateFormat.format(dateTime);
}

String timestampIntoHourFormat(int timestamp) {
  if(timestamp==AppConstants.defaultLastMessageTimestamp){
    return "";
  } else {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateFormat dateFormat = DateFormat('a h:mm');
    return dateFormat.format(dateTime);
  }
}

bool isDifferentDay(int timestamp1, int timestamp2) {
  DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(timestamp1);
  DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(timestamp2);

  return dateTime1.year != dateTime2.year ||
      dateTime1.month != dateTime2.month ||
      dateTime1.day != dateTime2.day;
}