import 'dart:convert';

List<SearchDoctorModel> searchDoctorModelFromJson(String str) =>
    List<SearchDoctorModel>.from(
        json.decode(str).map((x) => SearchDoctorModel.fromJson(x)));

String searchDoctorModelToJson(List<SearchDoctorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchDoctorModel {
  SearchDoctorModel({
    this.fullName,
    this.branchId,
    this.clinicId,
    this.userId,
    this.doctorColor,
  });

  String? fullName;
  String? branchId;
  dynamic clinicId;
  String? userId;
  String? doctorColor;

  factory SearchDoctorModel.fromJson(Map<String, dynamic> json) =>
      SearchDoctorModel(
        fullName: json["fullName"],
        branchId: json["branchId"],
        clinicId: json["clinicId"],
        userId: json["userId"],
        doctorColor: json["doctorColor"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "branchId": branchId,
        "clinicId": clinicId,
        "userId": userId,
        "doctorColor": doctorColor,
      };
}
