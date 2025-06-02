import 'dart:convert';

import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/search_model.dart';
import 'package:denta_soft/utils/ToastM.dart';
import 'package:dio/dio.dart';

import '../models/PatientModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class PatientServices {
  Future<List<PatientModel>> postSearchPatients({
    SearchModel? searchModel,
  }) async {
    Map<String, dynamic> jsonValues = {};
    List<PatientModel> patientsList = [];

    jsonValues.addAll({
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "branchId": GlobalData.accountData!.objectData.branchId,
      "patientName": searchModel!.patientName ?? '',
      "patientCode": searchModel.patientCode ?? '',
      "nationalId": searchModel.nationalId ?? '',
      "mobile": searchModel.mobile ?? '',
      "houseHeadNumber": searchModel.houseHeadNumber ?? '',
      "houseHeadName": searchModel.houseHeadName ?? '',
      "medicalInsuranceId": searchModel.medicalInsuranceId ?? '',
      "isActive": searchModel.isActive ?? true,
    });

    var body = jsonEncode(jsonValues);
    print("QQQQ::" + body.toString());

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.postSearchPatients,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          print("LL::" + value.toString());
          patientsList.add(PatientModel.fromJson(value));
        }
      }
      return patientsList;
    } catch (e) {
      print("QQQQ::" + e.toString());
      return patientsList;
    }
  }

  Future<PatientModel> getPatientDetails(String patientId) async {
    PatientModel patientDetails = PatientModel();
    print(ApiRoutes.getPatientDetials + "?id=$patientId");
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getPatientDetials + "?id=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientData:${response.body}");

      if (response.statusCode == 200) {
        var object = jsonDecode(response.body!);
        patientDetails = PatientModel.fromJson(object);
        GlobalData.patientData = patientDetails;
      }
      return patientDetails;
    } catch (e) {
      print("QQQQ::" + e.toString());
      return patientDetails;
    }
  }

  Future<List<CalendarViewModel>> getPatientCalendars({
    required String patientId,
  }) async {
    print(ApiRoutes.getPatientDetials + "?id=$patientId");
    List<CalendarViewModel> calendarsList = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getPatientDetials + "?id=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientData:${response.body}");

      if (response.statusCode == 200) {
        var objectData = jsonDecode(response.body!);
        var object = objectData["calendarViewModels"];
        for (var value in object) {
          calendarsList.add(CalendarViewModel.fromJson(value));
        }
      }
      return calendarsList;
    } catch (e) {
      print("calender list error::" + e.toString());
      return calendarsList;
    }
  }

  Future<List<PatientProcedureViewModel>> getPatientProcedure({
    required String patientId,
  }) async {
    print(ApiRoutes.getPatientDetials + "?id=$patientId");
    List<PatientProcedureViewModel> patientProcedureView = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getPatientDetials + "?id=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientData:${response.body}");

      if (response.statusCode == 200) {
        var objectData = jsonDecode(response.body!);
        var object = objectData["patientProcedureViewModels"];
        for (var value in object) {
          patientProcedureView.add(PatientProcedureViewModel.fromJson(value));
        }
      }
      return patientProcedureView;
    } catch (e) {
      print("patientProcedureView list error::" + e.toString());
      return patientProcedureView;
    }
  }

  Future<List<Diease>> getPatientDiseases({required String patientId}) async {
    print(ApiRoutes.getPatientDetials + "?id=$patientId");
    List<Diease> diseasesList = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getPatientDetials + "?id=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientData:${response.body}");

      if (response.statusCode == 200) {
        var objectData = jsonDecode(response.body!);
        var object = objectData["dieases"];
        for (var value in object) {
          diseasesList.add(Diease.fromJson(value));
        }
      }
      return diseasesList;
    } catch (e) {
      print("diseases list error::" + e.toString());
      return diseasesList;
    }
  }

  Future<List<ProductViewModel>> getPatientProducts({
    required String patientId,
  }) async {
    print(ApiRoutes.getPatientDetials + "?id=$patientId");
    List<ProductViewModel> productList = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getPatientDetials + "?id=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientData:${response.body}");

      if (response.statusCode == 200) {
        var objectData = jsonDecode(response.body!);
        var object = objectData["productViewModels"];
        for (var value in object) {
          productList.add(ProductViewModel.fromJson(value));
        }
      }
      return productList;
    } catch (e) {
      print("products list error::" + e.toString());
      return productList;
    }
  }

  Future<bool> deleteDisease({required List<String> ids}) async {
    var body = jsonEncode(ids);
    print("body is:$body");
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteDieases,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deletePatientProduct({required List<int> ids}) async {
    var body = jsonEncode(ids);
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deletePatientProducts,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> addNewPatient({required Map<String, dynamic> body}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.addNewPatient,
        body: jsonEncode(body),
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print("QQQQ::" + e.toString());
      return false;
    }
  }

  Future<bool> editProfile({required String body}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.editProfile,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print('s${json.decode(response.body!)}');
      if (response.statusCode == 200) {
        ToastM.show(S().doneeditingdetailsprofile);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAttachmentsProfile({required FormData body}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveAttachments,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        ToastM.show(S().uploadedimages);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveDiseasesProfile({required String body}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveDieases,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        ToastM.show(S().SaveDieases);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveProductDiseasesProfile({required String body}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveProductDieases,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      if (response.statusCode == 200) {
        ToastM.show(S().SaveDieases);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
