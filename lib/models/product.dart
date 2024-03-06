class ProductModel {
  //id , price, title, image,
  String? sId;
  String? title;
  String? price;
  String? image;

  ProductModel({
    this.sId,
    this.title,
    this.price,
    this.image,
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
      sId: map['sId'],
      title: map['title'],
      price: map['price'],
      image: map['image'],
    );
  }
}
