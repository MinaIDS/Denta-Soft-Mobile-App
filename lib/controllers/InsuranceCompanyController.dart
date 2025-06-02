import '../models/InsuranceModel.dart';
import '../services/InsuranceCompanyServices.dart';

class InsuranceCompanyController {
  // Get all insurance companies
  Future<List<InsuranceModel>> getInsuranceCompanies() async {
    List<InsuranceModel> insurance = [];
    try {
      insurance = await InsuranceCompanyServices().getInsuranceCompanies();
      return insurance;
    } catch (e) {
      print("Error fetching insurance companies: $e");
      return []; // Return an empty list in case of error
    }
  }

  // Get a specific insurance company by ID
  Future<InsuranceModel?> getInsuranceCompany(String id) async {
    try {
      InsuranceModel? insurance =
          await InsuranceCompanyServices().getInsuranceCompany(id);
      return insurance;
    } catch (e) {
      print("Error fetching insurance company with ID $id: $e");
      return null; // Return null in case of error
    }
  }

  // Edit or update an insurance company
  Future<bool> saveInsuranceCompany(
      {required InsuranceModel insurances}) async {
    try {
      bool status = await InsuranceCompanyServices()
          .saveInsuranceCompany(insurances: insurances);
      return status;
    } catch (e) {
      print("Error saving insurance company: $e");
      return false; // Return false if an error occurs
    }
  }

  // Delete an insurance company
  Future<bool> deleteInsuranceCompany(
      {required String id, required String branchId}) async {
    try {
      bool status = await InsuranceCompanyServices()
          .deleteInsuranceCompany(id: id, branchId: branchId);
      return status;
    } catch (e) {
      print("Error deleting insurance company with ID $id: $e");
      return false; // Return false if an error occurs
    }
  }
}
