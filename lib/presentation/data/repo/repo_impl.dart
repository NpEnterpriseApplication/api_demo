import '../../model/response_model/index.dart';
import '../index.dart';

class RepoImpl extends Repository {
  RepoImpl({required DataProvider dataProvider}) : _dataProvider = dataProvider;

  final DataProvider _dataProvider;

//============================= Api =====================================
  @override
  Future<GetProductResponse> getProductData() {
    return _dataProvider.getProductData();
  }

  @override
  Future<ProductDetailsResponse> productDetails({required String id}) {
    return _dataProvider.productDetails(id: id);
  }
}
