import 'dart:convert';
import '../services/DashBoardServices.dart';
import '../utils/General.dart';

class DashBoardController {
  // Get daily worked hours data
  Future<List<Map<String, dynamic>>> getDailyWorkedHours() async {
    List<Map<String, dynamic>> dataList = [];
    try {
      String result = await DashBoardServices().getDailyWorkedHours();
      if (result.isNotEmpty && result != "error") {
        List<dynamic> object = jsonDecode(result);
        if (object.isNotEmpty) {
          for (var value in object) {
            if (value['key'] != null && value['value'] != null) {
              dataList.add({"key": value['key'], "value": value['value']});
            }
          }
        }
      }
      return dataList;
    } catch (e) {
      print("Error in getDailyWorkedHours: $e");
      return dataList;
    }
  }

  // Get daily appointment async data
  Future<List<Map<String, dynamic>>> getDailyAppointmentAsyncs() async {
    List<Map<String, dynamic>> dataList = [];
    try {
      String result = await DashBoardServices().getDailyAppointmentAsyncs();
      if (result.isNotEmpty && result != "error") {
        List<dynamic> object = jsonDecode(result);
        if (object.isNotEmpty) {
          for (var value in object) {
            if (value['key'] != null && value['value'] != null) {
              dataList.add({"key": value['key'], "value": value['value']});
            }
          }
        }
      }
      return dataList;
    } catch (e) {
      print("Error in getDailyAppointmentAsyncs: $e");
      return dataList;
    }
  }

  // Get all dashboard data by combining the daily worked hours and daily appointments async data
  Future<Map<String, dynamic>> getAllDashboardData() async {
    List<Map<String, dynamic>> _dailyWorkedHours = await getDailyWorkedHours();
    List<Map<String, dynamic>> _dailyAppointmentAsyncs =
        await getDailyAppointmentAsyncs();

    double _dailyWorkedHoursMAXVALUE =
        50; // Default max value for daily worked hours

    String dailyWorkedHoursKey = '';
    String dailyWorkedHoursValue = '';
    String dailyAppointmentAsyncsKey = '';
    String dailyAppointmentAsyncsValue = '';

    // Process the daily worked hours
    for (var element in _dailyWorkedHours) {
      var key = element['key'];
      var value = element['value'];

      if (key != null && value != null) {
        dailyWorkedHoursKey += " '${convertDateFormat(DateTime.parse(key))}' ,";
        dailyWorkedHoursValue += " $value ,";

        if (_dailyWorkedHoursMAXVALUE < value) {
          _dailyWorkedHoursMAXVALUE = value + 20;
        }
      }
    }

    // Process the daily appointment asyncs
    for (var element in _dailyAppointmentAsyncs) {
      var key = element['key'];
      var value = element['value'];

      if (key != null) {
        dailyAppointmentAsyncsKey +=
            " '${convertDateFormat(DateTime.parse(key))}' ,";
        dailyAppointmentAsyncsValue +=
            " {value: ${value == 0 ? null : value}, name: '${convertDateFormat(DateTime.parse(key))}'} ,";
      }
    }

    // Prepare the final data map
    Map<String, dynamic> allData = {
      "dailyWorkedHoursKey": dailyWorkedHoursKey,
      "dailyWorkedHoursValue": dailyWorkedHoursValue,
      "dailyAppointmentAsyncsKey": dailyAppointmentAsyncsKey,
      "dailyAppointmentAsyncsValue": dailyAppointmentAsyncsValue,
      "dailyWorkedHoursMAXVALUE": _dailyWorkedHoursMAXVALUE.toString()
    };

    return allData;
  }
}
