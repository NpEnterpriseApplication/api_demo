import 'package:get/get.dart';
import '../../../utilz/utils.dart';
import '../../data/index.dart';
import '../../model/response_model/index.dart';

class TopProductController extends GetxController {
//==============================================================================
// * Properties *
//==============================================================================
  var isLoading = false.obs;
  var isDetailsLoading = false.obs;
  Rx<GetProductResponse> productResponse = GetProductResponse().obs;
  Rx<ProductDetailsResponse> productDetailsRes = ProductDetailsResponse().obs;

//==============================================================================
// * Get Life cycle *
//==============================================================================
  @override
  void onInit() {
    getProductData();
    super.onInit();
  }

//==============================================================================
// *Helper *
//==============================================================================
  Future<void> getProductData() async {
    try {
      isLoading(true);
      final response = await Repo.getInstance().getProductData();
      productResponse.value = response;

    } catch (e) {
      appPrint('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getProductDetails({required String id}) async {
    try {
      isLoading(true);
      final response = await Repo.getInstance().productDetails(id: id);
      appPrint("res${response.toJson()}");
      productDetailsRes.value = response;
    } catch (e) {
      appPrint('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
