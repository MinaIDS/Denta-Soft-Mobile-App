import 'dart:convert';

List<IOComeModel> ioComeModelFromJson(String str) => List<IOComeModel>.from(
    json.decode(str).map((x) => IOComeModel.fromJson(x)));

String ioComeModelToJson(List<IOComeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IOComeModel {
  String? incomexpansesDoctorsId; // Nullable String
  String? branchId;
  String? clinicId; // Nullable String
  int? type;
  String? category;
  double? amount;
  String? referenceId;
  DateTime? happenDate;
  dynamic updateUserId;
  String? comments;
  String? createUserId;
  DateTime? createdDate;
  dynamic updateDate;
  DateTime? createdOn; // Nullable DateTime
  dynamic modifiedon;

  IOComeModel({
    this.incomexpansesDoctorsId,
    this.branchId,
    this.clinicId,
    this.type,
    this.category,
    this.amount,
    this.referenceId,
    this.happenDate,
    this.updateUserId,
    this.comments,
    this.createUserId,
    this.createdDate,
    this.updateDate,
    this.createdOn,
    this.modifiedon,
  });

  factory IOComeModel.fromJson(Map<String, dynamic> json) => IOComeModel(
        incomexpansesDoctorsId: json["incomexpansesDoctorsId"] as String?,
        branchId: json["branchId"] as String,
        clinicId: json["clinicId"] as String?,
        type: json["type"] as int,
        category: json["category"] as String,
        amount: (json["amount"] as num).toDouble(),
        referenceId: json["referenceId"] as String? ?? "",
        happenDate: DateTime.parse(json["happenDate"] as String),
        updateUserId: json["updateUserId"],
        comments: json["comments"] as String,
        createUserId: json["createUserId"] as String,
        createdDate: DateTime.parse(json["createdDate"] as String),
        updateDate: json["updateDate"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"] as String),
        modifiedon: json["modifiedon"],
      );

  Map<String, dynamic> toJson() => {
        "incomexpansesDoctorsId": incomexpansesDoctorsId,
        "branchId": branchId,
        "clinicId": clinicId,
        "type": type,
        "category": category,
        "amount": amount,
        "referenceId": referenceId,
        "happenDate": happenDate!.toIso8601String(),
        "updateUserId": updateUserId,
        "comments": comments,
        "createUserId": createUserId,
        "createdDate": createdDate!.toIso8601String(),
        "updateDate": updateDate,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon,
      };
}
