
import 'package:intl/intl.dart';

class DateConverter {
  
static String charMonthDDYYY(DateTime dateTime) {
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return formattedDate; }
}


 String charMonthDDYYY(DateTime dateTime) {
  
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return formattedDate;
}
