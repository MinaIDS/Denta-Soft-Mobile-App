import 'dart:convert';
import 'package:flutter/material.dart';

List<CalendarModel> calendarModelFromJson(String str) =>
    List<CalendarModel>.from(
        json.decode(str).map((x) => CalendarModel.fromJson(x)));

String calendarModelToJson(List<CalendarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarModel {
  CalendarModel({
    this.appointmentId = "",
    this.patientId = "",
    this.patientName = "",
    this.patientPhone = "",
    this.lastVisit,
    this.medicalInsuranceId = "",
    this.isBlock = false,
    this.isAllDay = false,
    this.updateUserId = "",
    this.createUserId = "",
    this.status = "",
    this.branchId = "",
    this.clinicId = "",
    this.startTime,
    this.endTime,
    this.startTimeZone = "",
    this.endTimeZone = "",
    this.background = Colors.blue,
    this.description = "",
    this.checkIn,
    this.checkOut,
    this.doctorColor = "",
    this.doctorName = "",
    this.doctorId = "",
    this.roomId = "",
    this.roomName = "",
    this.createdOn,
    this.modifiedon,
    this.resourceIds = const [],
  });

  String appointmentId;
  String patientId;
  String patientName;
  String patientPhone;
  dynamic lastVisit;
  String medicalInsuranceId;
  bool isBlock;
  bool isAllDay;
  String updateUserId;
  String createUserId;
  String status;
  String branchId;
  String clinicId;
  DateTime? startTime;
  DateTime? endTime;
  String startTimeZone;
  String endTimeZone;
  Color background;
  String description;
  dynamic checkIn;
  dynamic checkOut;
  String doctorColor;
  String doctorName;
  String doctorId;
  String roomId;
  String roomName;
  DateTime? createdOn;
  dynamic modifiedon;
  List<dynamic> resourceIds;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        appointmentId: json["appointmentId"] ?? "",
        patientId: json["patientId"] ?? "",
        patientName: json["patientName"] ?? "",
        patientPhone: json["patientPhone"] ?? "",
        lastVisit: json["lastVisit"],
        medicalInsuranceId: json["medicalInsuranceId"] ?? "",
        isBlock: json["isBlock"] ?? false,
        isAllDay: json["isAllDay"] ?? false,
        updateUserId: json["updateUserId"] ?? "",
        createUserId: json["createUserId"] ?? "",
        status: json["status"] ?? "",
        branchId: json["branchId"] ?? "",
        clinicId: json["clinicId"] ?? "",
        startTime: json["startTime"] != null
            ? DateTime.parse(json["startTime"])
            : null,
        endTime:
            json["endTime"] != null ? DateTime.parse(json["endTime"]) : null,
        startTimeZone: json["startTimeZone"] ?? "",
        endTimeZone: json["endTimeZone"] ?? "",
        description: json["description"] ?? "",
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        doctorColor: json["doctorColor"] ?? "",
        doctorName: json["doctorName"] ?? "",
        doctorId: json["doctorId"] ?? "",
        roomId: json["roomId"] ?? "",
        roomName: json["roomName"] ?? "",
        createdOn: json["createdOn"] != null
            ? DateTime.parse(json["createdOn"])
            : null,
        modifiedon: json["modifiedon"],
        resourceIds: List<dynamic>.from(json["resourceIds"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "patientId": patientId,
        "patientName": patientName,
        "patientPhone": patientPhone,
        "lastVisit": lastVisit,
        "medicalInsuranceId": medicalInsuranceId,
        "isBlock": isBlock,
        "isAllDay": isAllDay,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "status": status,
        "branchId": branchId,
        "clinicId": clinicId,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "startTimeZone": startTimeZone,
        "endTimeZone": endTimeZone,
        "description": description,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "doctorColor": doctorColor,
        "doctorName": doctorName,
        "doctorId": doctorId,
        "roomId": roomId,
        "roomName": roomName,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon,
        "resourceIds": resourceIds,
      };
}
