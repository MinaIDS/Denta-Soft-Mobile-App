import 'dart:convert';

import 'package:denta_soft/utils/api_routes.dart';

import 'GlobalHttp.dart';

class UploadImagePatientServices {
  // EIDTProfile SERVICE
  Future<bool> uploadImagePatient() async {
    bool status = false;

    String body = json.encode({});

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.updateImage,
        body: body,
        authorizationHeader: true,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return status;
    }
  }
}
