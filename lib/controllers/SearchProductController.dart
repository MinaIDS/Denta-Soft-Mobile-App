import '../models/PatientModel.dart';
import '../models/SearchProductModel.dart';
import '../services/SearchProductServices.dart';

class SearchProductController {
  // Fetch products based on the search name
  Future<List<SearchProductModel>> getProducts(String searchProductName) async {
    List<SearchProductModel> products = [];
    try {
      products = await SearchProductServices()
          .getSearchProuducts(productName: searchProductName);
      return products;
    } catch (e) {
      print("Error fetching products: $e");
      return products; // return an empty list in case of failure
    }
  }

  // Save product disease
  Future<bool> saveProductDiease({
    ProductViewModel? productModel, // Ensure proper null safety
    required String patientId, // Make these fields non-nullable
    required List<int> productIds, // Product IDs should be required
  }) async {
    try {
      bool status = await SearchProductServices().saveproductDiease(
        productViewModel: productModel!,
        patientId: patientId,
        productIds: productIds,
      );
      return status;
    } catch (e) {
      print("Error saving product disease: $e");
      return false; // Return false in case of error
    }
  }
}
