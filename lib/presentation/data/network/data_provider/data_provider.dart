import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../constant/index.dart';
import '../../../model/response_model/index.dart';

class DataProvider {
  DataProvider();

//============================= headers ========================================
  Map<String, String> _getHeader() {
    return <String, String>{
      'Host': '<calculated when request is sent>',
    };
  }

  // String errorMessage(http.Response response) {
  //   String responseJson = response.body;
  //   Map<String, dynamic> jsonResponse = jsonDecode(responseJson);
  //   String errorMessage = jsonResponse["Message"];
  //   return errorMessage;
  // }

//========================= Get Product =======================================

  Future<GetProductResponse> getProductData() async {
    String url = "${Constants.baseUrl}api/productList/get";
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return GetProductResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed To  Get Product Data.');
    }
  }

//========================= Get Product Details =======================================

  Future<ProductDetailsResponse> productDetails({required String id}) async {
    String url = "${Constants.baseUrl}api/product/getbyId/$id";
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return ProductDetailsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed To  Get Product Details.');
    }
  }

}
