import '../models/DiseaseModel.dart';
import '../services/DiseaseServices.dart';

class DiseaseController {
  // Get list of diseases
  Future<List<DiseaseModel>> getDiseases() async {
    List<DiseaseModel> diseases = [];
    try {
      diseases = await DiseaseServices().getDiseases();
      return diseases;
    } catch (e) {
      print("Error fetching diseases: $e");
      return diseases; // Return an empty list if error occurs
    }
  }

  // Save disease
  Future<bool> saveDisease(
      {required DiseaseModel diseaseModel, required String patientId}) async {
    try {
      bool status = await DiseaseServices()
          .saveDiease(diseaseModel: diseaseModel, patientId: patientId);
      return status;
    } catch (e) {
      print("Error saving disease: $e");
      return false; // Return false if an error occurs
    }
  }
}
