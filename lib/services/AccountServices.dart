import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models/AccountModel.dart';
import '../utils/GlobalData.dart';
import '../utils/SharedPrafrance/SharedPrafranceKeys.dart';
import '../utils/SharedPrafrance/SharedPrafranceManager.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class AccountServices {
  Future<bool> login(
    String clinicName,
    String userName,
    String password,
  ) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "userName": userName,
      "password": password,
      "clinicName": clinicName,
      "isMobile": true,
    });

    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.login,
        body: body,
        contentTypeHeader: "application/json",
        cid: clinicName,
      );

      // OK 200
      if (response.statusCode == 200) {
        SharedPrafranceManager().setData(
          SecureStorageKeys.accountData,
          response.body,
        );
        GlobalData.accountData = AccountModel.fromJson(
          json.decode(response.body!),
        );
        status = true;
      } else {
        status = false;
      }
      return status;
    } catch (e) {
      print("DDDD:" + e.toString());
      return status;
    }
  }

  Future<bool> forgetPassword(String email) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({"emailAddress": email});
    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.forgetPassword,
        body: body,
        contentTypeHeader: "application/json",
      );

      // OK 200
      if (response.statusCode == 200) {
        status = true;
      } else {
        status = false;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  // update profile image
  Future<bool> updateProfileImage(
    String userId,
    File imageFile,
    bool isMyProfile,
  ) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "UserId": userId,
      "FormFile": await MultipartFile.fromFile(imageFile.path),
    });
    //var body = jsonEncode(jsonValues);
    FormData data = FormData.fromMap(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.updateImage,
        body: data,
        contentTypeHeader: "application/x-www-form-urlencoded",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        final respnseJson = json.decode(response.body!);
        if (isMyProfile) {
          GlobalData.accountData!.objectData.photoJson = respnseJson['message'];
          SharedPrafranceManager().setData(
            SecureStorageKeys.accountData,
            json.encode(GlobalData.accountData!.toJson()),
          );
        }
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

  //change user password
  Future<bool> resetPassword(
    String userName,
    String oldPassword,
    String newPassword,
  ) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "userName": userName,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    });
    var body = jsonEncode(jsonValues);
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.changePassword,
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
      return status;
    }
  }

  // update user
  Future<bool> updateUser({
    String? roleId,
    String? calendarType,
    String? emailAddress,
    String? phone,
    String? phoneWork,
    String? nationalId,
    String? address,
    String? fullName,
    String? code,
  }) async {
    Map<String, dynamic> jsonValues = {};
    bool status = false;

    jsonValues.addAll({
      "userId": GlobalData.accountData!.objectData.userId,
      "fullName": fullName ?? "", // Null check
      "password": "",
      "emailAddress": emailAddress ?? "", // Null check
      "mobile": phone ?? "", // Null check
      "cityId": GlobalData.accountData!.objectData.cityId,
      "active": true,
      "subscriptionType": "",
      "calendarView": calendarType ?? "", // Null check
      "branchId": GlobalData.accountData!.objectData.branchId,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "doctorColor": "",
      "currentUserId": GlobalData.accountData!.objectData.currentUserId,
      "clinicName": GlobalData.accountData!.objectData.clinicName,
      "branchName": GlobalData.accountData!.objectData.branchName,
      "updateUserId": GlobalData.accountData!.objectData.updateUserId,
      "photoJson": GlobalData.accountData!.objectData.photoJson,
      "nationalId": nationalId ?? "", // Null check
      "address": address ?? "", // Null check
      "comments": "",
      "countryId": GlobalData.accountData!.objectData.countryId,
      "userName": GlobalData.accountData!.objectData.userName,
      "phoneWork": phoneWork ?? "", // Null check
      "nationailityId": GlobalData.accountData!.objectData.nationailityId,
      "specilalityId": GlobalData.accountData!.objectData.specilalityId,
      "faxNumber": GlobalData.accountData!.objectData.faxNumber,
      "code": code ?? "", // Null check
      "title": GlobalData.accountData!.objectData.title,
      "userRole": roleId ?? "", // Null check
      "gender": GlobalData.accountData!.objectData.gender,
      "workColor": GlobalData.accountData!.objectData.workColor,
      "offColor": GlobalData.accountData!.objectData.offColor,
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
        status = await getUserData(GlobalData.accountData!.objectData.userId!);
      } else {
        status = false;
      }
      return status;
    } catch (e) {
      print(e.toString());
      return status;
    }
  }

  Future<bool> getUserData(String userId) async {
    bool status = false;

    final url = ApiRoutes.getUserData + "UserId=$userId";
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        url,
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        final respnseJson = json.decode(response.body!);
        GlobalData.accountData!.objectData = ObjectData.fromJson(respnseJson);
        SharedPrafranceManager().setData(
          SecureStorageKeys.accountData!,
          json.encode(GlobalData.accountData!.toJson()),
        );
        status = true;
      } else {
        status = false;
      }
      return status;
    } catch (e) {
      print("DDDD:" + e.toString());
      return status;
    }
  }
}
