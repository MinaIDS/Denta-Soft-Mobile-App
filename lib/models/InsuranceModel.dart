class InsuranceModel {
  String? medicalInsuranceId; // Nullable String
  String? medicalCompany; // Nullable String
  double? toleranceRatio; // Nullable double
  String? updateUserId; // Nullable String
  String? createUserId; // Nullable String
  String? branchId; // Nullable String
  bool? isDefault; // Nullable bool

  InsuranceModel({
    this.medicalInsuranceId,
    this.medicalCompany,
    this.toleranceRatio,
    this.updateUserId,
    this.createUserId,
    this.branchId,
    this.isDefault,
  });

  // Factory constructor to create an instance of InsuranceModel from JSON
  InsuranceModel.fromJson(Map<String, dynamic> json) {
    medicalInsuranceId = json['medicalInsuranceId'];
    medicalCompany = json['medicalCompany'];
    toleranceRatio = json['toleranceRatio']
        ?.toDouble(); // Make sure it's safely converted to a double
    updateUserId = json['updateUserId'] ?? ""; // Default empty string if null
    createUserId = json['createUserId'];
    branchId = json['branchId'];
    isDefault = json['isDefault'];
  }

  // Method to convert InsuranceModel instance into a JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicalInsuranceId'] = this.medicalInsuranceId;
    data['medicalCompany'] = this.medicalCompany;
    data['toleranceRatio'] = this.toleranceRatio;
    data['updateUserId'] = this.updateUserId;
    data['createUserId'] = this.createUserId;
    data['branchId'] = this.branchId;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
