import 'dart:convert';

// Function to parse JSON into a list of GetProceduresModel objects
List<GetProceduresModel> getProceduresModelFromJson(String str) =>
    List<GetProceduresModel>.from(
        json.decode(str).map((x) => GetProceduresModel.fromJson(x)));

// Function to convert a list of GetProceduresModel objects into JSON string
String getProceduresModelToJson(List<GetProceduresModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Function to parse JSON into a single GetProceduresModel object
GetProceduresModel getSingleProcedureModelFromJson(String str) =>
    GetProceduresModel.fromJson(json.decode(str));

// Function to convert a single GetProceduresModel object into a JSON string
String getSingleProcedureModelToJson(GetProceduresModel data) =>
    json.encode(data.toJson());

class GetProceduresModel {
  GetProceduresModel({
    this.clinicId,
    this.treatmentBranchId,
    this.procedureId,
    this.procedureName,
    this.updateUserId,
    this.createUserId,
    this.branchId,
    this.procedureCode,
    this.listPriceProcedureViewModelLst,
    this.createdOn,
    this.modifiedon,
  });

  String? clinicId; // Nullable String
  String? treatmentBranchId; // Nullable String
  String? procedureId; // Nullable String
  String? procedureName; // Nullable String
  String? updateUserId; // Nullable String
  String? createUserId; // Nullable String
  String? branchId; // Nullable String
  dynamic procedureCode; // Nullable dynamic
  List<ListPriceProcedureViewModelLst>?
      listPriceProcedureViewModelLst; // Nullable List
  DateTime? createdOn; // Nullable DateTime
  DateTime? modifiedon; // Nullable DateTime

  // Factory constructor to create an instance of GetProceduresModel from a JSON object
  factory GetProceduresModel.fromJson(Map<String, dynamic> json) =>
      GetProceduresModel(
        clinicId: json["clinicId"],
        treatmentBranchId: json["treatmentBranchId"],
        procedureId: json["procedureId"],
        procedureName: json["procedureName"],
        updateUserId: json["updateUserId"],
        createUserId: json["createUserId"],
        branchId: json["branchId"],
        procedureCode: json["procedureCode"],
        listPriceProcedureViewModelLst:
            json["listPriceProcedureViewModelLst"] == null
                ? null
                : List<ListPriceProcedureViewModelLst>.from(
                    json["listPriceProcedureViewModelLst"].map(
                        (x) => ListPriceProcedureViewModelLst.fromJson(x))),
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  // Method to convert GetProceduresModel instance into a JSON object
  Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "treatmentBranchId": treatmentBranchId,
        "procedureId": procedureId,
        "procedureName": procedureName,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "branchId": branchId,
        "procedureCode": procedureCode,
        "listPriceProcedureViewModelLst": listPriceProcedureViewModelLst == null
            ? null
            : List<dynamic>.from(
                listPriceProcedureViewModelLst!.map((x) => x.toJson())),
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon?.toIso8601String(),
      };
}

class ListPriceProcedureViewModelLst {
  ListPriceProcedureViewModelLst({
    this.listProcedureId,
    this.procedureId,
    this.medicalInsuranceId,
    this.clinicId,
    this.branchId,
    this.price,
    this.updateUserId,
    this.createUserId,
    this.createdOn,
    this.modifiedon,
  });

  String? listProcedureId; // Nullable String
  String? procedureId; // Nullable String
  String? medicalInsuranceId; // Nullable String
  String? clinicId; // Nullable String
  String? branchId; // Nullable String
  double? price; // Nullable double
  dynamic updateUserId; // Nullable dynamic
  String? createUserId; // Nullable String
  DateTime? createdOn; // Nullable DateTime
  DateTime? modifiedon; // Nullable DateTime

  // Factory constructor to create an instance of ListPriceProcedureViewModelLst from a JSON object
  factory ListPriceProcedureViewModelLst.fromJson(Map<String, dynamic> json) =>
      ListPriceProcedureViewModelLst(
        listProcedureId: json["listProcedureId"],
        procedureId: json["procedureId"],
        medicalInsuranceId: json["medicalInsuranceId"],
        clinicId: json["clinicId"],
        branchId: json["branchId"],
        price: json["price"]?.toDouble(),
        updateUserId: json["updateUserId"],
        createUserId: json["createUserId"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  // Method to convert ListPriceProcedureViewModelLst instance into a JSON object
  Map<String, dynamic> toJson() => {
        "listProcedureId": listProcedureId,
        "procedureId": procedureId,
        "medicalInsuranceId": medicalInsuranceId,
        "clinicId": clinicId,
        "branchId": branchId,
        "price": price,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon?.toIso8601String(),
      };
}
