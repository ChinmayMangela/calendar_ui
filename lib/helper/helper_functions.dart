
import 'package:intl/intl.dart';

class HelperFunctions {

  static String getFormattedDate(DateTime date) {
    final formatter = DateFormat('d MMMM, E');
    final formattedDate = formatter.format(date);
    return formattedDate;
  }
}