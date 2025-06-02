import 'dart:convert';

List<TreatmentModel> treatmentModelFromJson(String str) =>
    List<TreatmentModel>.from(
        json.decode(str).map((x) => TreatmentModel.fromJson(x)));

String treatmentModelToJson(List<TreatmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TreatmentModel {
  String? treatmentId;
  String? treatmentBranchId;
  String? branchId;
  String? imgName;
  String? treatmentName;
  String? updateUserId;
  String? createUserId;
  bool? active;
  List<ProcedureViewModelLst>? procedureViewModelLst;

  TreatmentModel({
    this.treatmentId,
    this.branchId,
    this.treatmentBranchId,
    this.imgName,
    this.treatmentName,
    this.updateUserId,
    this.createUserId,
    this.active,
    this.procedureViewModelLst,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) => TreatmentModel(
        treatmentId: json['treatmentId'] as String?,
        branchId: json['branchId'] as String?,
        treatmentBranchId: json['treatmentBranchId'] as String?,
        imgName: json['imgName'] as String?,
        treatmentName: json['treatmentName'] as String?,
        updateUserId: json['updateUserId'] as String?,
        createUserId: json['createUserId'] as String?,
        active: json['active'] as bool?,
        procedureViewModelLst: json['procedureViewModelLst'] != null
            ? List<ProcedureViewModelLst>.from(json['procedureViewModelLst']
                .map((x) => ProcedureViewModelLst.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'treatmentId': treatmentId,
        'branchId': branchId,
        'treatmentBranchId': treatmentBranchId,
        'imgName': imgName,
        'treatmentName': treatmentName,
        'updateUserId': updateUserId,
        'createUserId': createUserId,
        'active': active,
        'procedureViewModelLst':
            procedureViewModelLst?.map((x) => x.toJson()).toList(),
      };
}

class ProcedureViewModelLst {
  String? treatmentId;
  String? procedureId;
  String? procedureName;
  String? updateUserId;
  String? createUserId;
  String? branchId;
  dynamic listPriceProcedureViewModelLst;

  ProcedureViewModelLst({
    this.treatmentId,
    this.procedureId,
    this.procedureName,
    this.updateUserId,
    this.createUserId,
    this.branchId,
    this.listPriceProcedureViewModelLst,
  });

  factory ProcedureViewModelLst.fromJson(Map<String, dynamic> json) =>
      ProcedureViewModelLst(
        treatmentId: json['treatmentId'] as String?,
        procedureId: json['procedureId'] as String?,
        procedureName: json['procedureName'] as String?,
        updateUserId: json['updateUserId'] as String?,
        createUserId: json['createUserId'] as String?,
        branchId: json['branchId'] as String?,
        listPriceProcedureViewModelLst: json['listPriceProcedureViewModelLst'],
      );

  Map<String, dynamic> toJson() => {
        'treatmentId': treatmentId,
        'procedureId': procedureId,
        'procedureName': procedureName,
        'updateUserId': updateUserId,
        'createUserId': createUserId,
        'branchId': branchId,
        'listPriceProcedureViewModelLst': listPriceProcedureViewModelLst,
      };
}
