import 'dart:convert';

// Function to parse JSON into a list of GetInsuranceCompaniesModel objects
List<GetInsuranceCompaniesModel> getInsuranceCompaniesModelFromJson(
        String str) =>
    List<GetInsuranceCompaniesModel>.from(
        json.decode(str).map((x) => GetInsuranceCompaniesModel.fromJson(x)));

// Function to convert a list of GetInsuranceCompaniesModel objects into JSON string
String getInsuranceCompaniesModelToJson(
        List<GetInsuranceCompaniesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetInsuranceCompaniesModel {
  GetInsuranceCompaniesModel({
    this.medicalInsuranceId,
    this.medicalCompany,
    this.toleranceRatio,
    this.updateUserId,
    this.createUserId,
    this.branchId,
    this.clinicId,
    this.isDefault,
    this.createdOn,
    this.modifiedon,
  });

  String? medicalInsuranceId; // Nullable String
  String? medicalCompany; // Nullable String
  double? toleranceRatio; // Nullable double
  String? updateUserId; // Nullable String
  String? createUserId; // Nullable String
  String? branchId; // Nullable String
  String? clinicId; // Nullable String
  bool? isDefault; // Nullable bool
  DateTime? createdOn; // Nullable DateTime
  DateTime? modifiedon; // Nullable DateTime

  // Factory constructor to create an instance of GetInsuranceCompaniesModel from a JSON object
  factory GetInsuranceCompaniesModel.fromJson(Map<String, dynamic> json) =>
      GetInsuranceCompaniesModel(
        medicalInsuranceId: json["medicalInsuranceId"],
        medicalCompany: json["medicalCompany"],
        toleranceRatio: json["toleranceRatio"]?.toDouble(),
        updateUserId: json["updateUserId"],
        createUserId: json["createUserId"],
        branchId: json["branchId"],
        clinicId: json["clinicId"],
        isDefault: json["isDefault"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  // Method to convert GetInsuranceCompaniesModel instance into a JSON object
  Map<String, dynamic> toJson() => {
        "medicalInsuranceId": medicalInsuranceId,
        "medicalCompany": medicalCompany,
        "toleranceRatio": toleranceRatio,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "branchId": branchId,
        "clinicId": clinicId,
        "isDefault": isDefault,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon?.toIso8601String(),
      };
}
