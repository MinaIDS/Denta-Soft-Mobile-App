import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class DashBoardServices {
  Future<String> getDailyWorkedHours() async {
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getDailyWorkedHours}?branchId=${GlobalData.accountData!.objectData.branchId!}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      if (response.statusCode == 200) {
        return response.body!;
      } else {
        return "erorr";
      }
    } catch (e) {
      print(e);
      return "erorr";
    }
  }

  Future<String> getDailyAppointmentAsyncs() async {
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getDailyAppointmentAsyncs}?branchId=${GlobalData.accountData!.objectData.branchId!}",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      if (response.statusCode == 200) {
        return response.body!;
      } else {
        return "erorr";
      }
    } catch (e) {
      print(e);
      return "erorr";
    }
  }
}
