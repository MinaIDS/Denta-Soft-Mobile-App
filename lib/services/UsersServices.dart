import 'dart:convert';

import 'package:denta_soft/models/AccountModel.dart';
import 'package:denta_soft/services/GlobalHttp.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/api_routes.dart';

class UsersServices {
  Future<List<ObjectData>> postSearchUsers({required String username}) async {
    Map<String, dynamic> jsonValues = new Map<String, dynamic>();
    List<ObjectData> usersList = [];

    jsonValues.addAll({
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "branchId": GlobalData.accountData!.objectData.branchId,
      "emailAddress": "",
      "mobile": "",
      "userName": username,
      "fullName": "",
      "cityId": "",
      "countryId": "",
    });
    var body = jsonEncode(jsonValues);
    print("QQQQ::" + body.toString());

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.getUsersSearch,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        object.forEach((value) {
          print("LL::" + value.toString());
          print("length::" + object.length.toString());
          usersList.add((ObjectData.fromJson(value)));
        });
      }
      return usersList;
    } catch (e) {
      print("QQQQ::" + e.toString());

      return usersList;
    }
  }

  // update user
  Future<bool> updateUser({
    required String userID,
    required ObjectData userData,
  }) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "userId": userID,
      "fullName": userData.fullName,
      "password": "11111111",
      "emailAddress": userData.emailAddress,
      "mobile": userData.mobile,
      "cityId": "CT3",
      "active": true,
      "subscriptionType": userData.subscriptionType,
      "calendarView": userData.calendarView,
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "doctorColor": "",
      "currentUserId": userData.currentUserId,
      "clinicName": userData.clinicName,
      "branchName": userData.branchName,
      "updateUserId": userData.updateUserId,
      "photoJson": userData.photoJson,
      "nationalId": userData.nationalId,
      "address": userData.address,
      "comments": "",
      "countryId": "CN1",
      "userName": userData.fullName,
      "phoneWork": userData.phoneWork,
      "nationailityId": 16,
      "specilalityId": 14,
      "faxNumber": userData.faxNumber,
      "code": userData.code,
      "title": userData.title,
      "userRole": userData.userRole,
      "gender": userData.gender,
      "workColor": userData.workColor,
      "offColor": userData.offColor,
    });

    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.updateUser,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      } else {
        status = false;
      }
      return status;
    } catch (e) {
      print(e.toString());
      return status;
    }
  }

  Future<bool> deleteUser({required List<String> ids}) async {
    var body = jsonEncode(ids);
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteUser,
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
      print(e.toString());
      return false;
    }
  }
}
