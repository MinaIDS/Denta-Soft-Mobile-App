import 'dart:convert';

import '../models/IOComeModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class FinancialServices {
  Future<List<IOComeModel>> getIOComes({String? from, String? to}) async {
    Map<String, dynamic> jsonValues = {};
    List<IOComeModel> iOComeList = [];

    jsonValues.addAll({
      "dateFrom": from,
      "dateto": to,
      "branchId": GlobalData.accountData!.objectData.branchId,
    });
    var body = jsonEncode(jsonValues);

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.getIOComes,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        iOComeList = ioComeModelFromJson(response.body!);
      }
      return iOComeList;
    } catch (e) {
      return iOComeList; // Return empty list in case of error
    }
  }

  Future<bool> saveIOCome({IOComeModel? selectedIOCome}) async {
    if (selectedIOCome == null) {
      return false; // Return false if selectedIOCome is null
    }

    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "createdOn": DateTime.now().toString(),
      "modifiedon": DateTime.now().toString(),
      "incomexpansesDoctorsId": selectedIOCome.incomexpansesDoctorsId,
      "type": selectedIOCome.type,
      "category": selectedIOCome.category,
      "amount": selectedIOCome.amount,
      "referenceId": selectedIOCome.referenceId,
      "happenDate":
          selectedIOCome.happenDate?.toString() ?? "", // Handle null value
      "updateUserId": GlobalData.accountData!.objectData.userId,
      "comments": selectedIOCome.comments,
      "createUserId": selectedIOCome.createUserId,
    });
    var body = jsonEncode(jsonValues);

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveIOCome,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<bool> deleteInsuranceCompany({String? id}) async {
    if (id == null) return false; // Return false if id is null

    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteIOCome,
        body: [id],
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
