import 'dart:convert';

import '../models/PatientModel.dart';
import '../models/SearchProductModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class SearchProductServices {
  Future<List<SearchProductModel>> getSearchProuducts({
    String? productName,
  }) async {
    List<SearchProductModel> productsList = [];

    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getSearchProducts}?productName=$productName",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("productsResponse::${response.body!}");
      // OK 200

      if (response.statusCode == 200) {
        print("productresponse:${response.body}");

        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          print("product::$value");
          print("length::${object.length}");
          productsList.add((SearchProductModel.fromJson(value)));
        }
      } else {
        print("productresponse:${response.body}");
      }
      return productsList;
    } catch (e) {
      print("error::$e");

      return productsList;
    }
  }

  // edit or update productDiease
  Future<bool> saveproductDiease({
    ProductViewModel? productViewModel,
    String? patientId,
    required List<int> productIds,
  }) async {
    Map<String, dynamic> jsonValues = <String, dynamic>{};
    jsonValues.addAll({
      "productId": productViewModel!.productId ?? 0,
      "patientId": patientId,
      "pDieseasId": productViewModel.diseaseId ?? 0,
      "productIds": productIds,
    });

    var body = jsonEncode(jsonValues);
    print("add productDiease body $body");

    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveProductDiease,
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
    } catch (e) {
      print(e.toString());

      return false;
    }
  }
}
