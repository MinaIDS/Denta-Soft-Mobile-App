class SearchModel {
  SearchModel({
    this.isActive = true,
    this.clinicId,
    this.branchId,
    this.patientName,
    this.patientCode,
    this.nationalId,
    this.mobile,
    this.houseHeadNumber,
    this.houseHeadName,
    this.medicalInsuranceId,
  });

  bool isActive;
  String? clinicId;
  String? branchId;
  String? patientName;
  String? patientCode;
  String? nationalId;
  String? mobile;
  String? houseHeadNumber;
  String? houseHeadName;
  String? medicalInsuranceId;

  Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "clinicId": clinicId,
        "branchId": branchId,
        "patientName": patientName,
        "patientCode": patientCode,
        "nationalId": nationalId,
        "mobile": mobile,
        "houseHeadNumber": houseHeadNumber,
        "houseHeadName": houseHeadName,
        "medicalInsuranceId": medicalInsuranceId,
      };

  // Optionally add fromJson method if you plan to parse this model from a JSON object
  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        isActive: json["isActive"] ?? true,
        clinicId: json["clinicId"],
        branchId: json["branchId"],
        patientName: json["patientName"],
        patientCode: json["patientCode"],
        nationalId: json["nationalId"],
        mobile: json["mobile"],
        houseHeadNumber: json["houseHeadNumber"],
        houseHeadName: json["houseHeadName"],
        medicalInsuranceId: json["medicalInsuranceId"],
      );

  // Optional: Equality operator and hashCode if you want to compare SearchModel instances
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchModel &&
        other.isActive == isActive &&
        other.clinicId == clinicId &&
        other.branchId == branchId &&
        other.patientName == patientName &&
        other.patientCode == patientCode &&
        other.nationalId == nationalId &&
        other.mobile == mobile &&
        other.houseHeadNumber == houseHeadNumber &&
        other.houseHeadName == houseHeadName &&
        other.medicalInsuranceId == medicalInsuranceId;
  }

  @override
  int get hashCode {
    return isActive.hashCode ^
        clinicId.hashCode ^
        branchId.hashCode ^
        patientName.hashCode ^
        patientCode.hashCode ^
        nationalId.hashCode ^
        mobile.hashCode ^
        houseHeadNumber.hashCode ^
        houseHeadName.hashCode ^
        medicalInsuranceId.hashCode;
  }
}
