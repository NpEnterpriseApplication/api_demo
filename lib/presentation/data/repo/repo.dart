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

  Future<LoginWithMobileResponse> mobileLogIn({required Map<String, dynamic> data});
  Future<VerifyOtpResponse> verifyOtp({required Map<String, dynamic> data});
}
