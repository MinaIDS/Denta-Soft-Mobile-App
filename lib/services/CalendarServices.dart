import 'dart:convert';

import 'package:denta_soft/models/SearchDoctorModel.dart';
import 'package:denta_soft/models/SearchPatientModel.dart';

import '../models/CalendarModel.dart';
import '../models/RoomModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class CalendarServices {
  Future<List<CalendarModel>> getAppointments({
    String? startDate,
    String? endDate,
  }) async {
    Map<String, dynamic> jsonValues = {};
    List<CalendarModel> appointments = [];

    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "fromDate": startDate,
      "toDate": endDate,
      "doctorId": GlobalData.accountData!.objectData.userId,
      "duration": 0,
    });

    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.getAppointments,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        appointments = calendarModelFromJson(response.body!);
      }
      return appointments;
    } catch (e) {
      return appointments;
    }
  }

  Future<List<CalendarModel>> saveAppointment({
    required CalendarModel appointment,
  }) async {
    Map<String, dynamic> jsonValues = {};
    List<CalendarModel> calendarList = [];

    DateTime startTimeZero = DateTime(
      appointment.startTime!.year,
      appointment.startTime!.month,
      appointment.startTime!.day,
      0,
      0,
      0,
    ).toUtc();
    DateTime endTimeimeZero = DateTime(
      appointment.endTime!.year,
      appointment.endTime!.month,
      appointment.endTime!.day,
      0,
      0,
      0,
    ).toUtc();

    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "appointmentId": appointment.appointmentId.isNotEmpty
          ? appointment.appointmentId
          : "",
      "doctorId": GlobalData.accountData!.objectData.userRole == "RL3"
          ? GlobalData.accountData!.objectData.userId
          : appointment.doctorId,
      "patientId": appointment.patientId,
      "isBlock": false,
      "isAllDay": appointment.isAllDay,
      "status": appointment.status,
      "startTime": appointment.isAllDay
          ? startTimeZero.toString()
          : appointment.startTime!.toUtc().toString(),
      "endTime": appointment.isAllDay
          ? endTimeimeZero.toString()
          : appointment.endTime!.toUtc().toString(),
      "description": appointment.description,
      "checkIn": appointment.startTime!.toUtc().toString(),
      "checkOut": appointment.endTime!.toUtc().toString(),
      "roomId": appointment.roomId,
    });

    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveAppointment,
        body: body.toString(),
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          print("LL::$value");
          print("length::${object.length}");
          calendarList.add(CalendarModel.fromJson(value));
        }
      }
      return calendarList;
    } catch (e) {
      return calendarList;
    }
  }

  Future<bool> deleteAppointment({required String appointmentId}) async {
    bool status = false;
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteAppointment,
        body: [appointmentId],
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<bool> updateAppointmentStatus({
    required String newStatus,
    required String appointmentId,
    required String updateUserId,
  }) async {
    bool status = false;

    Map<String, dynamic> jsonValues = {};
    jsonValues.addAll({
      "status": newStatus,
      "appointmentId": appointmentId,
      "statusUpdateDate": DateTime.now().toString(),
      "updateUserId": GlobalData.accountData!.objectData.userId,
    });

    var body = jsonEncode(jsonValues);

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.updateAppointmentStatus,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<bool> sendReminder({required String appointmentId}) async {
    bool status = false;

    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.sendSMSMessageManual}?appointmentId=$appointmentId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<List<RoomModel>> getRooms() async {
    // ignore: unused_local_variable
    Map<String, dynamic> jsonValues = {};
    List<RoomModel> rooms = [];

    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getRooms}?branchId=${GlobalData.accountData!.objectData.branchId!}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      print("getRooms::${response.body!}");

      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          print("LL::$value");
          print("length::${object.length}");
          rooms.add(RoomModel.fromJson(value));
        }
      }
      return rooms;
    } catch (e) {
      print("DDF::$e");
      return rooms;
    }
  }

  Future<List<SearchPatientModel>> searchPatient(String name) async {
    Map<String, dynamic> jsonValues = {};
    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "patientName": name,
    });
    var body = jsonEncode(jsonValues);

    List<SearchPatientModel> searchPatientList = [];

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.getPatientSearchByName,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      if (response.statusCode == 200) {
        searchPatientList = searchPatientModelFromJson(response.body!);
      }

      return searchPatientList;
    } catch (e) {
      return searchPatientList;
    }
  }

  Future<List<SearchDoctorModel>> getAllDoctors() async {
    List<SearchDoctorModel> searchDoctorList = [];

    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getDoctorsNames}?branchId=${GlobalData.accountData!.objectData.branchId}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      if (response.statusCode == 200) {
        searchDoctorList = searchDoctorModelFromJson(response.body!);
      }

      return searchDoctorList;
    } catch (e) {
      return searchDoctorList;
    }
  }
}
