import 'dart:io';

import 'package:denta_soft/utils/ToastM.dart';
import '../services/AccountServices.dart';

class AccountController {
  Future<bool> login(
    String clinicName,
    String userName,
    String password,
  ) async {
    try {
      bool result = await AccountServices().login(
        clinicName,
        userName,
        password,
      );
      return result;
    } catch (e) {
      return false; // Return false in case of failure
    }
  }

  Future<bool> forgetPassword(String email) async {
    try {
      bool result = await AccountServices().forgetPassword(email);
      ToastM.show('ChangedSuccessfully');
      return result;
    } catch (e) {
      return false; // Return false in case of failure
    }
  }

  // Upload image
  Future<bool> updateProfileImage(
    String userId,
    File imageFile,
    bool isMyProfile,
  ) async {
    try {
      bool result = await AccountServices().updateProfileImage(
        userId,
        imageFile,
        isMyProfile,
      );
      return result;
    } catch (e) {
      return false; // Return false in case of failure
    }
  }

  Future<bool> resetPassword(
    String userName,
    String oldPassword,
    String newPassword,
  ) async {
    try {
      bool result = await AccountServices().resetPassword(
        userName,
        oldPassword,
        newPassword,
      );
      return result;
    } catch (e) {
      return false; // Return false in case of failure
    }
  }

  Future<bool> updateUser({
    String? fullName,
    String? emailAddress,
    String? calendarType,
    String? nationalId,
    String? address,
    String? phoneWork,
    String? mobile,
    String? code,
    String? roleId,
  }) async {
    fullName = fullName ?? '';
    emailAddress = emailAddress ?? '';
    calendarType = calendarType ?? '';
    nationalId = nationalId ?? ''; //
    address = address ?? '';
    phoneWork = phoneWork ?? '';
    mobile = mobile ?? '';
    code = code ?? '';
    roleId = roleId ?? '';

    try {
      bool result = await AccountServices().updateUser(
        address: address,
        calendarType: calendarType,
        code: code,
        emailAddress: emailAddress,
        fullName: fullName,
        roleId: roleId,
        nationalId: nationalId,
        phone: mobile,
        phoneWork: phoneWork,
      );
      return result;
    } catch (e) {
      return false; // Return false in case of failure
    }
  }
}
