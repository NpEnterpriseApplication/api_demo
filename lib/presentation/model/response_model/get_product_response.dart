// To parse this JSON data, do
//
//     final getProductResponse = getProductResponseFromJson(jsonString);

import 'dart:convert';

GetProductResponse getProductResponseFromJson(String str) => GetProductResponse.fromJson(json.decode(str));

String getProductResponseToJson(GetProductResponse data) => json.encode(data.toJson());

class GetProductResponse {
  final String? message;
  final Data? data;
  final int? total;
  final int? limit;
  final int? page;
  final int? pages;

  GetProductResponse({
    this.message,
    this.data,
    this.total,
    this.limit,
    this.page,
    this.pages,
  });

  factory GetProductResponse.fromJson(Map<String, dynamic> json) => GetProductResponse(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    total: json["total"],
    limit: json["limit"],
    page: json["page"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "total": total,
    "limit": limit,
    "page": page,
    "pages": pages,
  };
}

class Data {
  final List<Doc>? docs;
  final int? totalDocs;
  final int? limit;
  final int? totalPages;
  final int? page;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final dynamic prevPage;
  final int? nextPage;

  Data({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    docs: json["docs"] == null ? [] : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
    totalDocs: json["totalDocs"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    page: json["page"],
    pagingCounter: json["pagingCounter"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class Doc {
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

  Doc({
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

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
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
