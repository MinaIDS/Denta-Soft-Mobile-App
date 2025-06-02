import 'dart:convert';

import 'package:denta_soft/utils/api_routes.dart';

import 'GlobalHttp.dart';

class EditDetailsPatientServices {
  // EIDTProfile SERVICE
  Future<bool> editDetailsPatient({
    String? email,
    String? firstName,
    String? lastName,
  }) async {
    bool status = false;

    String body = json.encode({
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
    });

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.editDetailsPatient,
        body: body,
        authorizationHeader: true,
      );

      // OK 200
      if (response.statusCode == 200) {
        // UserModel userModel =  userModelFromJson(response.body!);
        // userModel.record!.accessToken = token;

        return true;
      }

      return false;
    } catch (e) {
      return status;
    }
  }
}
