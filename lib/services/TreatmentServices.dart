import 'dart:convert';

import 'package:denta_soft/models/GetProceduresModel.dart';

import '../models/TreatmentModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class TreatmentServices {
  // get insurance company
  Future<List<TreatmentModel>> getTreatmentList() async {
    List<TreatmentModel> treatments = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getTreatments +
            "?branchId=${GlobalData.accountData!.objectData.branchId}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("QQQ::" + response.body!);
      print("objectData::" + GlobalData.accountData!.objectData.clinicId!);

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        object.forEach((value) {
          treatments.add(TreatmentModel.fromJson(value));
        });
      }
      print("WEWE::" + treatments.length.toString());

      return treatments;
    } catch (e) {
      return treatments;
    }
  }

  // edit/update insurance company
  Future<bool> saveInsuranceCompany({required TreatmentModel treatment}) async {
    Map<String, dynamic> jsonValues = {};

    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "createUserId": GlobalData.accountData!.objectData.userId,
      "medicalCompany": treatment.treatmentName,
      "medicalInsuranceId": treatment.treatmentName,
      "toleranceRatio": treatment.treatmentName,
      "updateUserId": GlobalData.accountData!.objectData.userId,
    });
    var body = jsonEncode(jsonValues);
    print("QQQQ::" + body);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveInsuranceCompany,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // delete insurance company
  Future<bool> deleteInsuranceCompany({required String id}) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteInsuranceCompany + "?id=$id",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // delete insurance company
  Future<bool> changeStatusTreatmentBranch({
    required String treatmentBranchId,
    required bool isActive,
  }) async {
    try {
      var body = jsonEncode([
        {"treatmentBranchId": treatmentBranchId, "isActive": isActive},
      ]);
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.DeleteTreatmentBranch,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // saveProcedure
  Future<bool> saveProcedure({
    required String treatmentBranchId,
    required String procedureName,
  }) async {
    Map<String, dynamic> jsonValues = {};

    jsonValues.addAll({
      "treatmentBranchId": treatmentBranchId,
      "procedureId": null,
      "procedureName": procedureName,
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
    });
    var body = jsonEncode(jsonValues);
    print("QQQQ::" + body);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveProcedure,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<GetProceduresModel>> getProcedures(
    String treatmentbranchId,
  ) async {
    List<GetProceduresModel> getProceduresModel = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getProcedures + "?treatmentbranchId=$treatmentbranchId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("getProcedures:${response.body}");
      // OK 200
      if (response.statusCode == 200) {
        getProceduresModel = getProceduresModelFromJson(response.body!);
      }
      return getProceduresModel;
    } catch (e) {
      print("QQQQ::: " + e.toString());

      return getProceduresModel;
    }
  }
}
