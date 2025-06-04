import 'dart:convert';

import '../models/InsuranceModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class InsuranceCompanyServices {
  // get insurance company
  Future<List<InsuranceModel>> getInsuranceCompanies() async {
    List<InsuranceModel> insurance = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getInsuranceCompanies}?clinicId=${GlobalData.accountData!.objectData.clinicId}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("insuranceResponse::${response.body!}");

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          // print("LL::" + value.toString());
          // print("length::" + object.length.toString());
          insurance.add((InsuranceModel.fromJson(value)));
        }
      }
      print("WEWE::${insurance.length}");

      return insurance;
    } catch (e) {
      return insurance;
    }
  }

  Future<InsuranceModel> getInsuranceCompany(String id) async {
    InsuranceModel insuranceModel = InsuranceModel();
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getInsuranceCompany}?id=$id",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("insuranceCompanyResponse::${response.body!}");

      // OK 200
      if (response.statusCode == 200) {
        var object = jsonDecode(response.body!);
        insuranceModel = InsuranceModel.fromJson(object);
        GlobalData.insuranceCompany = insuranceModel.medicalCompany!;
        print("insuranceCompany::${GlobalData.insuranceCompany!}");
      }

      return insuranceModel;
    } catch (e) {
      return insuranceModel;
    }
  }

  //

  // edit/update insurance company
  Future<bool> saveInsuranceCompany({InsuranceModel? insurances}) async {
    Map<String, dynamic> jsonValues = <String, dynamic>{};

    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "createUserId": GlobalData.accountData!.objectData.userId,
      "medicalCompany": insurances!.medicalCompany,
      "medicalInsuranceId": insurances.medicalInsuranceId,
      "toleranceRatio": insurances.toleranceRatio,
      "updateUserId": GlobalData.accountData!.objectData.userId,
    });
    var body = jsonEncode(jsonValues);
    print("QQQQ::$body");
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
  Future<bool> deleteInsuranceCompany({
    required String id,
    required String branchId,
  }) async {
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteInsuranceCompany,
        body: {"medicalInsuranceId": id, "branchId": branchId},
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
}
