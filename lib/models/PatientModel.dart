import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    this.patientId,
    this.clinicId,
    this.branchId,
    this.patientName,
    this.patientCode,
    this.medicalInsuranceNo,
    this.isActive,
    this.age,
    this.title,
    this.maritalStatus,
    this.gender,
    this.occupation,
    this.email,
    this.houseHeadNumber,
    this.createUserId,
    this.updateUserId,
    this.houseHolderName,
    this.comments,
    this.employer,
    this.patientType,
    this.photoJson,
    this.nationalId,
    this.mobile,
    this.medicalInsuranceId,
    this.address,
    this.phoneWork,
    this.nationailityId,
    this.faxNumber,
    this.isAdult,
    this.lastVisit,
    this.dateOfBirth,
    this.dieases,
    this.payments,
    this.productViewModels,
    this.noteViewModels,
    this.calendarViewModels,
    this.patientProcedureViewModels,
    this.createdOn,
    this.modifiedon,
  });

  String? patientId;
  String? clinicId;
  String? branchId;
  String? patientName;
  String? patientCode;
  dynamic medicalInsuranceNo;
  bool? isActive;
  int? age;
  String? title;
  String? maritalStatus;
  String? gender;
  String? occupation;
  String? email;
  dynamic houseHeadNumber;
  dynamic createUserId;
  dynamic updateUserId;
  dynamic houseHolderName;
  dynamic comments;
  dynamic employer;
  String? patientType;
  String? photoJson;
  dynamic nationalId;
  String? mobile;
  String? medicalInsuranceId;
  dynamic address;
  dynamic phoneWork;
  String? nationailityId;
  String? faxNumber;
  bool? isAdult;
  dynamic lastVisit;
  DateTime? dateOfBirth;
  List<Diease>? dieases;
  dynamic payments;
  List<ProductViewModel>? productViewModels;
  List<NoteViewModel>? noteViewModels;
  List<CalendarViewModel>? calendarViewModels;
  List<PatientProcedureViewModel>? patientProcedureViewModels;
  dynamic createdOn;
  dynamic modifiedon;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        patientId: json["patientId"] as String?,
        clinicId: json["clinicId"] as String?,
        branchId: json["branchId"] as String?,
        patientName: json["patientName"] as String?,
        patientCode: json["patientCode"] as String?,
        medicalInsuranceNo: json["medicalInsuranceNo"],
        isActive: json["isActive"] as bool?,
        age: json["age"] as int?,
        title: json["title"] as String?,
        maritalStatus: json["maritalStatus"] as String?,
        gender: json["gender"] as String?,
        occupation: json["occupation"] as String?,
        email: json["email"] as String?,
        houseHeadNumber: json["houseHeadNumber"],
        createUserId: json["createUserId"],
        updateUserId: json["updateUserId"],
        houseHolderName: json["houseHolderName"],
        comments: json["comments"],
        employer: json["employer"],
        patientType: json["patientType"] as String?,
        photoJson: json["photoJson"] as String?,
        nationalId: json["nationalId"],
        mobile: json["mobile"] as String?,
        medicalInsuranceId: json["medicalInsuranceId"] as String?,
        address: json["address"],
        phoneWork: json["phoneWork"],
        nationailityId: json["nationailityId"] as String?,
        faxNumber: json["faxNumber"] as String?,
        isAdult: json["isAdult"] as bool?,
        lastVisit: json["lastVisit"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        dieases: json["dieases"] == null
            ? null
            : List<Diease>.from(json["dieases"].map((x) => Diease.fromJson(x))),
        payments: json["payments"],
        productViewModels: json["productViewModels"] == null
            ? null
            : List<ProductViewModel>.from(json["productViewModels"]
                .map((x) => ProductViewModel.fromJson(x))),
        noteViewModels: json["noteViewModels"] == null
            ? null
            : List<NoteViewModel>.from(
                json["noteViewModels"].map((x) => NoteViewModel.fromJson(x))),
        calendarViewModels: json["calendarViewModels"] == null
            ? null
            : List<CalendarViewModel>.from(json["calendarViewModels"]
                .map((x) => CalendarViewModel.fromJson(x))),
        patientProcedureViewModels: json["patientProcedureViewModels"] == null
            ? null
            : List<PatientProcedureViewModel>.from(
                json["patientProcedureViewModels"]
                    .map((x) => PatientProcedureViewModel.fromJson(x))),
        createdOn: json["createdOn"],
        modifiedon: json["modifiedon"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "clinicId": clinicId,
        "branchId": branchId,
        "patientName": patientName,
        "patientCode": patientCode,
        "medicalInsuranceNo": medicalInsuranceNo,
        "isActive": isActive,
        "age": age,
        "title": title,
        "maritalStatus": maritalStatus,
        "gender": gender,
        "occupation": occupation,
        "email": email,
        "houseHeadNumber": houseHeadNumber,
        "createUserId": createUserId,
        "updateUserId": updateUserId,
        "houseHolderName": houseHolderName,
        "comments": comments,
        "employer": employer,
        "patientType": patientType,
        "photoJson": photoJson,
        "nationalId": nationalId,
        "mobile": mobile,
        "medicalInsuranceId": medicalInsuranceId,
        "address": address,
        "phoneWork": phoneWork,
        "nationailityId": nationailityId,
        "faxNumber": faxNumber,
        "isAdult": isAdult,
        "lastVisit": lastVisit,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "dieases": dieases == null
            ? null
            : List<dynamic>.from(dieases!.map((x) => x.toJson())),
        "payments": payments,
        "productViewModels": productViewModels == null
            ? null
            : List<dynamic>.from(productViewModels!.map((x) => x.toJson())),
        "noteViewModels": noteViewModels == null
            ? null
            : List<dynamic>.from(noteViewModels!.map((x) => x.toJson())),
        "calendarViewModels": calendarViewModels == null
            ? null
            : List<dynamic>.from(calendarViewModels!.map((x) => x.toJson())),
        "patientProcedureViewModels": patientProcedureViewModels == null
            ? null
            : List<dynamic>.from(
                patientProcedureViewModels!.map((x) => x.toJson())),
        "createdOn": createdOn,
        "modifiedon": modifiedon,
      };
}

class CalendarViewModel {
  CalendarViewModel({
    this.appointmentId,
    this.patientId,
    this.patientName,
    this.patientPhone,
    this.lastVisit,
    this.medicalInsuranceId,
    this.isBlock,
    this.isAllDay,
    this.updateUserId,
    this.createUserId,
    this.status,
    this.branchId,
    this.clinicId,
    this.startTime,
    this.endTime,
    this.description,
    this.checkIn,
    this.checkOut,
    this.doctorColor,
    this.doctorName,
    this.doctorId,
    this.roomId,
    this.roomName,
    this.createdOn,
    this.modifiedon,
  });

  String? appointmentId;
  String? patientId;
  dynamic patientName;
  dynamic patientPhone;
  dynamic lastVisit;
  dynamic medicalInsuranceId;
  bool? isBlock;
  bool? isAllDay;
  dynamic updateUserId;
  dynamic createUserId;
  String? status;
  String? branchId;
  dynamic clinicId;
  DateTime? startTime;
  DateTime? endTime;
  String? description;
  DateTime? checkIn;
  dynamic checkOut;
  dynamic doctorColor;
  String? doctorName;
  String? doctorId;
  String? roomId;
  dynamic roomName;
  DateTime? createdOn;
  DateTime? modifiedon;

  factory CalendarViewModel.fromJson(Map<String, dynamic> json) =>
      CalendarViewModel(
        appointmentId: json["appointmentId"] as String?,
        patientId: json["patientId"] as String?,
        patientName: json["patientName"],
        patientPhone: json["patientPhone"],
        lastVisit: json["lastVisit"],
        medicalInsuranceId: json["medicalInsuranceId"],
        isBlock: json["isBlock"] as bool?,
        isAllDay: json["isAllDay"] as bool?,
        updateUserId: json["updateUserId"],
        createUserId: json["createUserId"],
        status: json["status"] as String?,
        branchId: json["branchId"] as String?,
        clinicId: json["clinicId"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        description: json["description"] as String?,
        checkIn:
            json["checkIn"] == null ? null : DateTime.parse(json["checkIn"]),
        checkOut: json["checkOut"],
        doctorColor: json["doctorColor"],
        doctorName: json["doctorName"] as String?,
        doctorId: json["doctorId"] as String?,
        roomId: json["roomId"] as String?,
        roomName: json["roomName"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "patientId": patientId,
        "patientName": patientName,
        "patientPhone": patientPhone,
        "lastVisit": lastVisit,
        "medicalInsuranceId": medicalInsuranceId,
        "isBlock": isBlock,
        "isAllDay": isAllDay,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "status": status,
        "branchId": branchId,
        "clinicId": clinicId,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "description": description,
        "checkIn": checkIn?.toIso8601String(),
        "checkOut": checkOut,
        "doctorColor": doctorColor,
        "doctorName": doctorName,
        "doctorId": doctorId,
        "roomId": roomId,
        "roomName": roomName,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedon?.toIso8601String(),
      };
}

class Diease {
  Diease({
    this.diseaseId,
    this.comments,
    this.diseaseTypeId,
    this.patientId,
    this.updateUserId,
    this.createUserId,
    this.diseaseName,
    this.createdOn,
    this.modifiedOn,
  });

  String? diseaseId; // Nullable
  String? comments; // Nullable
  int? diseaseTypeId; // Nullable
  String? patientId; // Nullable
  dynamic updateUserId; // Nullable
  String? createUserId; // Nullable
  String? diseaseName; // Nullable (spelling corrected)
  DateTime? createdOn; // Nullable
  dynamic modifiedOn; // Nullable

  factory Diease.fromJson(Map<String, dynamic> json) => Diease(
        diseaseId: json["diseaseId"] as String?,
        comments: json["comments"] as String?,
        diseaseTypeId: json["diseaseTypeId"] as int?,
        patientId: json["patientId"] as String?,
        updateUserId: json["updateUserId"],
        createUserId: json["createUserId"] as String?,
        diseaseName: json["diseaseName"] as String?, // Corrected spelling
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedOn: json["modifiedon"],
      );

  Map<String, dynamic> toJson() => {
        "diseaseId": diseaseId,
        "comments": comments,
        "diseaseTypeId": diseaseTypeId,
        "patientId": patientId,
        "updateUserId": updateUserId,
        "createUserId": createUserId,
        "diseaseName": diseaseName, // Corrected spelling
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedOn,
      };
}

class NoteViewModel {
  NoteViewModel({
    this.noteId,
    this.patientId,
    this.comments,
    this.createUserId,
    this.updateUserId,
    this.createdBy,
    this.creationDate,
    this.createdOn,
    this.modifiedOn,
  });

  String? noteId; // Nullable
  String? patientId; // Nullable
  String? comments; // Nullable
  String? createUserId; // Nullable
  dynamic updateUserId; // Nullable
  String? createdBy; // Nullable
  DateTime? creationDate; // Nullable
  dynamic createdOn; // Nullable
  dynamic modifiedOn; // Nullable

  factory NoteViewModel.fromJson(Map<String, dynamic> json) => NoteViewModel(
        noteId: json["noteId"] as String?,
        patientId: json["patientId"] as String?,
        comments: json["comments"] as String?,
        createUserId: json["createUserId"] as String?,
        updateUserId: json["updateUserId"],
        createdBy: json["createdBy"] as String?,
        creationDate: json["creationDate"] == null
            ? null
            : DateTime.parse(json["creationDate"]),
        createdOn: json["createdOn"],
        modifiedOn: json["modifiedon"],
      );

  Map<String, dynamic> toJson() => {
        "noteId": noteId,
        "patientId": patientId,
        "comments": comments,
        "createUserId": createUserId,
        "updateUserId": updateUserId,
        "createdBy": createdBy,
        "creationDate": creationDate?.toIso8601String(),
        "createdOn": createdOn,
        "modifiedon": modifiedOn,
      };
}

class PatientProcedureViewModel {
  PatientProcedureViewModel({
    this.patientProcedureId,
    this.patientId,
    this.doctorId,
    this.doctorName,
    this.procedureId,
    this.treatmentId,
    this.toothNum,
    this.patientName,
    this.qty,
    this.discount,
    this.feesAfterDiscount,
    this.balance,
    this.dentalChartCode,
    this.status,
    this.teethExtras,
    this.comments,
    this.procedureActionName,
    this.appointmentId,
    this.createUserId,
    this.modifiedId,
    this.createDate,
    this.fees,
    this.credit,
    this.clinicId,
    this.branchId,
    this.procedureInvoiceList,
    this.createdOn,
    this.modifiedOn,
  });

  String? patientProcedureId; // Nullable
  String? patientId; // Nullable
  dynamic doctorId; // Nullable
  String? doctorName; // Nullable
  String? procedureId; // Nullable
  String? treatmentId; // Nullable
  String? toothNum; // Nullable
  dynamic patientName; // Nullable
  dynamic qty; // Nullable
  dynamic discount; // Nullable
  dynamic feesAfterDiscount; // Nullable
  dynamic balance; // Nullable
  String? dentalChartCode; // Nullable
  String? status; // Nullable
  String? teethExtras; // Nullable
  String? comments; // Nullable
  String? procedureActionName; // Nullable
  dynamic appointmentId; // Nullable
  String? createUserId; // Nullable
  dynamic modifiedId; // Nullable
  DateTime? createDate; // Nullable
  dynamic fees; // Nullable
  dynamic credit; // Nullable
  String? clinicId; // Nullable
  String? branchId; // Nullable
  dynamic procedureInvoiceList; // Nullable
  dynamic createdOn; // Nullable
  DateTime? modifiedOn; // Nullable

  factory PatientProcedureViewModel.fromJson(Map<String, dynamic> json) =>
      PatientProcedureViewModel(
        patientProcedureId: json["patientProcedureId"] as String?,
        patientId: json["patientId"] as String?,
        doctorId: json["doctorId"],
        doctorName: json["doctorName"] as String?,
        procedureId: json["procedureId"] as String?,
        treatmentId: json["treatmentId"] as String?,
        toothNum: json["toothNum"] as String?,
        patientName: json["patientName"],
        qty: json["qty"],
        discount: json["discount"],
        feesAfterDiscount: json["feesAfterDiscount"],
        balance: json["balance"],
        dentalChartCode: json["dentalChartCode"] as String?,
        status: json["status"] as String?,
        teethExtras: json["teethExtras"] as String?,
        comments: json["comments"] as String?,
        procedureActionName: json["procedureActionName"] as String?,
        appointmentId: json["appointmentId"],
        createUserId: json["createUserId"] as String?,
        modifiedId: json["modifiedId"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        fees: json["fees"],
        credit: json["credit"],
        clinicId: json["clinicId"] as String?,
        branchId: json["branchId"] as String?,
        procedureInvoiceList: json["procedureInvoiceList"],
        createdOn: json["createdOn"],
        modifiedOn: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  Map<String, dynamic> toJson() => {
        "patientProcedureId": patientProcedureId,
        "patientId": patientId,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "procedureId": procedureId,
        "treatmentId": treatmentId,
        "toothNum": toothNum,
        "patientName": patientName,
        "qty": qty,
        "discount": discount,
        "feesAfterDiscount": feesAfterDiscount,
        "balance": balance,
        "dentalChartCode": dentalChartCode,
        "status": status,
        "teethExtras": teethExtras,
        "comments": comments,
        "procedureActionName": procedureActionName,
        "appointmentId": appointmentId,
        "createUserId": createUserId,
        "modifiedId": modifiedId,
        "createDate": createDate?.toIso8601String(),
        "fees": fees,
        "credit": credit,
        "clinicId": clinicId,
        "branchId": branchId,
        "procedureInvoiceList": procedureInvoiceList,
        "createdOn": createdOn,
        "modifiedon": modifiedOn?.toIso8601String(),
      };
}

class ProductViewModel {
  ProductViewModel({
    this.productEn,
    this.productAr,
    this.productId,
    this.patientId,
    this.diseaseId,
    this.createdOn,
    this.modifiedOn,
  });

  String? productEn; // Nullable
  String? productAr; // Nullable
  int? productId; // Nullable
  String? patientId; // Nullable
  dynamic diseaseId; // Nullable
  DateTime? createdOn; // Nullable
  dynamic modifiedOn; // Nullable

  factory ProductViewModel.fromJson(Map<String, dynamic> json) =>
      ProductViewModel(
        productEn: json["productEn"] as String?,
        productAr: json["productAr"] as String?,
        productId: json["productId"] as int?,
        patientId: json["patientId"] as String?,
        diseaseId: json["diseaseId"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modifiedOn: json["modifiedon"],
      );

  Map<String, dynamic> toJson() => {
        "productEn": productEn,
        "productAr": productAr,
        "productId": productId,
        "patientId": patientId,
        "diseaseId": diseaseId,
        "createdOn": createdOn?.toIso8601String(),
        "modifiedon": modifiedOn,
      };
}
