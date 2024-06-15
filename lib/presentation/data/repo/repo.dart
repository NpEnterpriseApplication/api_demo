import '../../model/response_model/index.dart';
import '../index.dart';

class Repo {
  static RepoImpl getInstance() {
    return RepoImpl(dataProvider: DataProvider());
  }
}

abstract class Repository {
//============================= Api =====================================

  Future<GetProductResponse> getProductData();

  Future<ProductDetailsResponse> productDetails({required String id});
}
