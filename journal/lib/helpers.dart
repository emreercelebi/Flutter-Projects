
class Helpers {

  static String dateToString(DateTime date) {
    final weekdays = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    final months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final weekday = weekdays[date.weekday];
    final month = months[date.month];
    final day = date.day;
    final year = date.year;

    return weekday + ', ' + month + ' ' + day.toString() + ', ' +
        year.toString();
  }
}