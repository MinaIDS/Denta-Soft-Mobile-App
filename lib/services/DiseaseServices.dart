import 'dart:convert';

import '../models/DiseaseModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class DiseaseServices {
  Future<List<DiseaseModel>> getDiseases() async {
    List<DiseaseModel> diseases = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        ApiRoutes.getDiseases,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );
      print("Diseases::${response.body!}");

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          diseases.add((DiseaseModel.fromJson(value)));
        }
      }
      print("diseaseLength::${diseases.length}");

      return diseases;
    } catch (e) {
      return diseases;
    }
  }

  // add diease
  Future<bool> saveDiease({
    DiseaseModel? diseaseModel,
    String? patientId,
  }) async {
    Map<String, dynamic> jsonValues = <String, dynamic>{};
    jsonValues.addAll({
      "diseaseId": "",
      "comments": "",
      "diseaseTypeId": diseaseModel!.id,
      "patientId": patientId,
      "updateUserId": GlobalData.accountData!.objectData.userId,
      "createUserId": GlobalData.accountData!.objectData.userId,
      "dieasesName": diseaseModel.value,
    });

    var body = jsonEncode([jsonValues]);
    print("add diease body $body");

    // try {
    GlobalHttpResponse response = await GlobalHttp.post(
      ApiRoutes.addDiease,
      body: body,
      contentTypeHeader: "application/json",
      authorizationHeader: GlobalData.accountData!.token,
    );

    if (response.statusCode == 200) {
      print("response:${response.body}");
      return true;
    } else {
      print(response.statusCode);
    }

    return false;
    // } catch (e) {
    //   print(e.toString());
    //
    //   return false;
    // }
  }
}
