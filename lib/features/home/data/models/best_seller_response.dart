class BestSellerResponse {
  int? status;
  String? message;
  BestSellerData? data;

  BestSellerResponse({
    this.status,
    this.message,
    this.data,
  });

  BestSellerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BestSellerData.fromJson(json['data']) : null;
  }
}

class BestSellerData {
  List<Product>? products;

  BestSellerData({this.products});

  BestSellerData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  num? priceAfterDiscount;
  int? stock;
  String? image;
  String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.image,
    this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount']; 
    stock = json['stock'];
    image = json['image'];
    category = json['category'];
  }
}