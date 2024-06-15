// To parse this JSON data, do
//
//     final productDetailsResponse = productDetailsResponseFromJson(jsonString);

import 'dart:convert';

ProductDetailsResponse productDetailsResponseFromJson(String str) => ProductDetailsResponse.fromJson(json.decode(str));

String productDetailsResponseToJson(ProductDetailsResponse data) => json.encode(data.toJson());

class ProductDetailsResponse {
  final String? message;
  final ProductDetails? data;

  ProductDetailsResponse({
    this.message,
    this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) => ProductDetailsResponse(
    message: json["message"],
    data: json["data"] == null ? null : ProductDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class ProductDetails {
  final String? id;
  final String? factoryId;
  final String? name;
  final String? category;
  final String? subcategory;
  final String? setSize;
  final String? setColor;
  final int? noOfPairs;
  final String? productBrand;
  final int? minPrice;
  final int? maxPrice;
  final String? sampleImage;
  final DateTime? createdAt;
  final List<dynamic>? reviews;
  final int? v;

  ProductDetails({
    this.id,
    this.factoryId,
    this.name,
    this.category,
    this.subcategory,
    this.setSize,
    this.setColor,
    this.noOfPairs,
    this.productBrand,
    this.minPrice,
    this.maxPrice,
    this.sampleImage,
    this.createdAt,
    this.reviews,
    this.v,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    id: json["_id"],
    factoryId: json["factoryId"],
    name: json["name"],
    category: json["category"],
    subcategory: json["subcategory"],
    setSize: json["setSize"],
    setColor: json["setColor"],
    noOfPairs: json["noOfPairs"],
    productBrand: json["productBrand"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    sampleImage: json["sampleImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "factoryId": factoryId,
    "name": name,
    "category": category,
    "subcategory": subcategory,
    "setSize": setSize,
    "setColor": setColor,
    "noOfPairs": noOfPairs,
    "productBrand": productBrand,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
    "sampleImage": sampleImage,
    "createdAt": createdAt?.toIso8601String(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "__v": v,
  };
}
