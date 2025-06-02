import '../models/ProcedureModel.dart';
import '../services/ProcedureServices.dart';

class ProcedureController {
  // get insurance company
  Future<List<ProcedureModel>> getProcedureList() async {
    List<ProcedureModel> procedures = [];
    try {
      procedures = await ProcedureServices().getProcedureList();

      return procedures;
    } catch (e) {
      return procedures;
    }
  }
}
