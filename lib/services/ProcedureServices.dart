import 'dart:convert';

import 'package:denta_soft/models/GetProceduresModel.dart';
import 'package:denta_soft/utils/ToastM.dart';

import '../models/ProcedureModel.dart';
import '../models/TreatmentModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class ProcedureServices {
  // get insurance company
  Future<List<ProcedureModel>> getProcedureList() async {
    List<ProcedureModel> procedures = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getProceduresByBranch +
            "?branchId=${GlobalData.accountData!.objectData.branchId}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("QQQ::" + response.body!);

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        object.forEach((value) {
          // print("LL::" + value.toString());
          // print("length::" + object.length.toString());
          procedures.add((ProcedureModel.fromJson(value)));
        });
      }
      print("WEWE::" + procedures.length.toString());

      return procedures;
    } catch (e) {
      return procedures;
    }
  }

  // edit/update insurance company
  Future<bool> saveInsuranceCompany({required TreatmentModel treatment}) async {
    Map<String, dynamic> jsonValues = new Map<String, dynamic>();

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

  Future<bool> deleteProcedure({required String ProcedureId}) async {
    var body = jsonEncode(["$ProcedureId"]);
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteProcedure,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("deleteProcedure:${response.body}");
      // OK 200
      if (response.statusCode == 200) {
        ToastM.show(json.decode(response.body!)['message']);
        return true;
      }
      return false;
    } catch (e) {
      print("QQQQ::: " + e.toString());

      return false;
    }
  }

  Future<GetProceduresModel> getSingleProcedure(String id) async {
    GetProceduresModel getProceduresModel = GetProceduresModel();
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getSingleProcedure + "?id=$id",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("getProcedures:${response.body}");
      // OK 200
      if (response.statusCode == 200) {
        getProceduresModel = getSingleProcedureModelFromJson(response.body!);
      }
      return getProceduresModel;
    } catch (e) {
      print("QQQQ::: " + e.toString());

      return getProceduresModel;
    }
  }
}
