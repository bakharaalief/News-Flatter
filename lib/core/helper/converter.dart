import 'package:timeago/timeago.dart' as timeago;

class Converter {
  static String toTimeAgo(String date) {
    DateTime dateTime = DateTime.parse(date);
    return timeago.format(dateTime);
  }
}
