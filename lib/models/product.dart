import 'package:uuid/uuid.dart';

class ProductModel {
  final String? sId,
      title,
      price,
      image,
      categoryId,
      productDescription,
      Seller_Id,
      shipmentId;

  ProductModel({
    this.sId,
    this.title,
    this.price,
    this.image,
    this.categoryId,
    this.productDescription,
    this.Seller_Id,
    this.shipmentId,
  });

  ProductModel copyWith({
    String? sId,
    String? title,
    String? price,
    String? image,
  }) {
    return ProductModel(
      sId: sId ?? this.sId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sId': sId,
      'title': title,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      sId: map['sid'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      categoryId: map['Category_Id'] ?? '',
      productDescription: map['ProductDescription'] ?? '',
      Seller_Id: map['Seller_Id'] ?? '',
      shipmentId: map['shipmentt_Id'] ?? '',
    );
  }
}
