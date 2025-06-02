import 'dart:convert';

List<SearchPatientModel> searchPatientModelFromJson(String str) =>
    List<SearchPatientModel>.from(
        json.decode(str).map((x) => SearchPatientModel.fromJson(x)));

String searchPatientModelToJson(List<SearchPatientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchPatientModel {
  SearchPatientModel({
    this.patientId,
    this.clinicId,
    this.branchId,
    this.patientName,
    this.createdOn,
    this.modifiedon,
  });

  String? patientId; // nullable field
  String? clinicId; // nullable field
  String? branchId; // nullable field
  String? patientName; // nullable field
  DateTime? createdOn; // nullable field
  DateTime? modifiedon; // nullable field

  factory SearchPatientModel.fromJson(Map<String, dynamic> json) =>
      SearchPatientModel(
        patientId: json["patientId"] as String?,
        clinicId: json["clinicId"] as String?,
        branchId: json["branchId"] as String?,
        patientName: json["patientName"] as String?,
        createdOn: json["createdOn"] != null
            ? DateTime.parse(json["createdOn"])
            : null,
        modifiedon: json["modifiedon"] != null
            ? DateTime.parse(json["modifiedon"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "clinicId": clinicId,
        "branchId": branchId,
        "patientName": patientName,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon?.toIso8601String(),
      };
}
