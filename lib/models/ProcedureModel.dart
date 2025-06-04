class ProcedureModel {
  late String treatmentId;
  late String procedureId;
  late String procedureName;
  late String updateUserId;
  late String createUserId;
  late String branchId;
  List<ListPriceProcedureViewModelLst>? listPriceProcedureViewModelLst;

  ProcedureModel({
    this.treatmentId = "",
    this.procedureId = "",
    this.procedureName = "",
    this.updateUserId = "",
    this.createUserId = "",
    this.branchId = "",
    this.listPriceProcedureViewModelLst, // Can be null
  });

  ProcedureModel.fromJson(Map<String, dynamic> json) {
    treatmentId = json['treatmentId'] ?? "";
    procedureId = json['procedureId'] ?? "";
    procedureName = json['procedureName'] ?? '';
    updateUserId = json['updateUserId'] ?? '';
    createUserId = json['createUserId'] ?? '';
    branchId = json['branchId'] ?? '';

    // If 'listPriceProcedureViewModelLst' is present in the JSON, parse it
    if (json['listPriceProcedureViewModelLst'] != null) {
      listPriceProcedureViewModelLst = [];
      json['listPriceProcedureViewModelLst'].forEach((v) {
        listPriceProcedureViewModelLst?.add(
          ListPriceProcedureViewModelLst.fromJson(v),
        );
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'treatmentId': treatmentId,
      'procedureId': procedureId,
      'procedureName': procedureName,
      'updateUserId': updateUserId,
      'createUserId': createUserId,
      'branchId': branchId,
      'listPriceProcedureViewModelLst': listPriceProcedureViewModelLst
          ?.map((v) => v.toJson())
          .toList(),
    };
  }
}

class ListPriceProcedureViewModelLst {
  late String listProcedureId;
  late String procedureId;
  late String medicalInsuranceId;
  late double price;
  late String updateUserId;
  late String createUserId;

  ListPriceProcedureViewModelLst({
    this.listProcedureId = "",
    this.procedureId = "",
    this.medicalInsuranceId = "",
    this.price = 0.0,
    this.updateUserId = "",
    this.createUserId = "",
  });

  ListPriceProcedureViewModelLst.fromJson(Map<String, dynamic> json) {
    listProcedureId = json['listProcedureId'] ?? "";
    procedureId = json['procedureId'] ?? "";
    medicalInsuranceId = json['medicalInsuranceId'] ?? "";
    price = json['price'] ?? 0.0;
    updateUserId = json['updateUserId'] ?? "";
    createUserId = json['createUserId'] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'listProcedureId': listProcedureId,
      'procedureId': procedureId,
      'medicalInsuranceId': medicalInsuranceId,
      'price': price,
      'updateUserId': updateUserId,
      'createUserId': createUserId,
    };
  }
}
