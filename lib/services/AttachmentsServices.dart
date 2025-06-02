import 'dart:convert';

import 'package:denta_soft/models/AttachmentsModel';
import 'package:denta_soft/utils/ToastM.dart';

import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class AttachmentsServices {
  Future<List<AttachmentsModel>> getAttachments(String patientId) async {
    List<AttachmentsModel> attachmentsModel = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getAttachments + "?patientId=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientAttachments:${response.body}");
      // OK 200
      if (response.statusCode == 200) {
        attachmentsModel = attachmentsModelFromJson(response.body!);
      }
      return attachmentsModel;
    } catch (e) {
      print("QQQQ::: " + e.toString());

      return attachmentsModel;
    }
  }

  Future<bool> deleteAttachments({String? AttachmentId}) async {
    var body = jsonEncode(["$AttachmentId"]);
    try {
      GlobalHttpResponse response = await GlobalHttp.delete(
        ApiRoutes.deleteAttachments,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("patientAttachments:${response.body}");
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
}
