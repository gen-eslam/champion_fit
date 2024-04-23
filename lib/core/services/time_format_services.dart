import 'package:intl/intl.dart';

abstract class TimeFormatServices {
  static String timeFormatyDayFullDateAndTime(DateTime dateTime) {
    // ==> 'Thu, 5/23/2013 10:21:47 AM'

    return DateFormat.yMEd().add_jms().format(dateTime);
  }

  static DateTime timeFormatToDateTimeDayFullDateAndTime(String dateTime) {
    return DateFormat.yMEd().add_jms().parse(dateTime);
  }

  // 03/5 12:00 AM
  static String timeFormatDayMonthAndTime(DateTime dateTime) {
    return DateFormat('MM/d h:mm a').format(dateTime);
  }

  static DateTime timeFormatToDateTimeDayMonthAndTime(String dateTime) {
    return DateFormat('MM/d h:mm a').parse(dateTime);
  }
}
