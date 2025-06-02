import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    required this.status,
    required this.message,
    required this.token,
    required this.objectData,
  });

  bool status;
  String message;
  String token;
  ObjectData objectData;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        status: json["status"] ?? false,
        message: json["message"] ?? '',
        token: json["token"] ?? '',
        objectData: ObjectData.fromJson(json["objectData"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "objectData": objectData.toJson(),
      };
}

class ObjectData {
  ObjectData({
    this.userId,
    this.fullName,
    this.password,
    this.emailAddress,
    this.mobile,
    this.cityId,
    this.active,
    this.subscriptionType,
    this.calendarView,
    this.branchId,
    this.clinicId,
    this.doctorColor,
    this.currentUserId,
    this.clinicName,
    this.branchName,
    this.updateUserId,
    this.photoJson,
    this.nationalId,
    this.address,
    this.comments,
    this.countryId,
    this.userName,
    this.phoneWork,
    this.nationailityId,
    this.specilalityId,
    this.faxNumber,
    this.code,
    this.title,
    this.userRole,
    this.gender,
    this.workColor,
    this.offColor,
    this.workingDays,
    this.workingHours,
    this.ledgerType,
    this.branchLang,
    this.branchMobile,
    this.branchCode,
  });

  String? userId;
  String? fullName;
  dynamic password;
  String? emailAddress;
  String? mobile;
  String? cityId;
  bool? active;
  String? subscriptionType;
  String? calendarView;
  String? branchId;
  String? clinicId;
  String? doctorColor;
  String? currentUserId;
  String? clinicName;
  String? branchName;
  String? updateUserId;
  String? photoJson;
  String? nationalId;
  String? address;
  String? comments;
  String? countryId;
  String? userName;
  String? phoneWork;
  dynamic nationailityId;
  String? specilalityId;
  String? faxNumber;
  String? code;
  String? title;
  String? userRole;
  String? gender;
  String? workColor;
  String? offColor;
  String? workingDays;
  String? workingHours;
  String? ledgerType;
  String? branchLang;
  String? branchMobile;
  String? branchCode;

  factory ObjectData.fromJson(Map<String, dynamic> json) => ObjectData(
        userId: json["userId"],
        fullName: json["fullName"],
        password: json["password"],
        emailAddress: json["emailAddress"],
        mobile: json["mobile"],
        cityId: json["cityId"],
        active: json["active"],
        subscriptionType: json["subscriptionType"],
        calendarView: json["calendarView"],
        branchId: json["branchId"],
        clinicId: json["clinicId"],
        doctorColor: json["doctorColor"],
        currentUserId: json["currentUserId"],
        clinicName: json["clinicName"],
        branchName: json["branchName"],
        updateUserId: json["updateUserId"],
        photoJson: json["photoJson"],
        nationalId: json["nationalId"],
        address: json["address"],
        comments: json["comments"],
        countryId: json["countryId"],
        userName: json["userName"],
        phoneWork: json["phoneWork"],
        nationailityId: json["nationailityId"],
        specilalityId: json["specilalityId"],
        faxNumber: json["faxNumber"],
        code: json["code"],
        title: json["title"],
        userRole: json["userRole"],
        gender: json["gender"],
        workColor: json["workColor"],
        offColor: json["offColor"],
        workingDays: json["workingDays"],
        workingHours: json["workingHours"],
        ledgerType: json["ledgerType"],
        branchLang: json["branchLang"],
        branchMobile: json["branchMobile"],
        branchCode: json["branchCode"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "password": password,
        "emailAddress": emailAddress,
        "mobile": mobile,
        "cityId": cityId,
        "active": active,
        "subscriptionType": subscriptionType,
        "calendarView": calendarView,
        "branchId": branchId,
        "clinicId": clinicId,
        "doctorColor": doctorColor,
        "currentUserId": currentUserId,
        "clinicName": clinicName,
        "branchName": branchName,
        "updateUserId": updateUserId,
        "photoJson": photoJson,
        "nationalId": nationalId,
        "address": address,
        "comments": comments,
        "countryId": countryId,
        "userName": userName,
        "phoneWork": phoneWork,
        "nationailityId": nationailityId,
        "specilalityId": specilalityId,
        "faxNumber": faxNumber,
        "code": code,
        "title": title,
        "userRole": userRole,
        "gender": gender,
        "workColor": workColor,
        "offColor": offColor,
        "workingDays": workingDays,
        "workingHours": workingHours,
        "ledgerType": ledgerType,
        "branchLang": branchLang,
        "branchMobile": branchMobile,
        "branchCode": branchCode,
      };
}

class Clinic {
  String? clinicId;
  String? clinicName;
  String? clinicCode;
  String? address;
  String? cityId;
  String? countryId;
  String? updateUserId;
  String? updateDate;
  String? createUserId;
  String? createDate;
  bool? active;
  String? mobile;
  List<dynamic>? branch; // Changed to List<dynamic> to handle empty/nullable
  List<dynamic>? user;

  Clinic({
    this.clinicId,
    this.clinicName,
    this.clinicCode,
    this.address,
    this.cityId,
    this.countryId,
    this.updateUserId,
    this.updateDate,
    this.createUserId,
    this.createDate,
    this.active,
    this.mobile,
    this.branch,
    this.user,
  });

  Clinic.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinicId'];
    clinicName = json['clinicName'];
    clinicCode = json['clinicCode'];
    address = json['address'];
    cityId = json['cityId'];
    countryId = json['countryId'];
    updateUserId = json['updateUserId'];
    updateDate = json['updateDate'];
    createUserId = json['createUserId'];
    createDate = json['createDate'];
    active = json['active'];
    mobile = json['mobile'];
    // Handle optional lists
    branch = json['branch'] ?? [];
    user = json['user'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinicId'] = clinicId;
    data['clinicName'] = clinicName;
    data['clinicCode'] = clinicCode;
    data['address'] = address;
    data['cityId'] = cityId;
    data['countryId'] = countryId;
    data['updateUserId'] = updateUserId;
    data['updateDate'] = updateDate;
    data['createUserId'] = createUserId;
    data['createDate'] = createDate;
    data['active'] = active;
    data['mobile'] = mobile;
    data['branch'] = branch;
    data['user'] = user;
    return data;
  }
}
