
import 'package:date_format/date_format.dart';

String convertDateFormat(DateTime dateTime){
 return formatDate(DateTime(dateTime.year, dateTime.month, dateTime.day), [yyyy, '-', mm, '-', dd]);
}

String convertTimeFormat(DateTime dateTime){
 return formatDate(DateTime(dateTime.hour, dateTime.minute), [hh, ':', mm]);
}

String convertDateTimeFormat(DateTime dateTime){
 return formatDate(DateTime(dateTime.year, dateTime.month, dateTime.day,dateTime.hour, dateTime.minute), [yyyy, '-', mm, '-', dd," ",hh, ':', mm]);
}

RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

String replaceNumberNoZero(double num){
 return num.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
}