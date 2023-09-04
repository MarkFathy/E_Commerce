
class ChangeFavModel {
  bool? status;
  String? message;
  Data? data;

  ChangeFavModel({this.status, this.message, this.data});

  ChangeFavModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product = json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(product != null) {
      _data["product"] = product?.toJson();
    }
    return _data;
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["price"] = price;
    _data["old_price"] = oldPrice;
    _data["discount"] = discount;
    _data["image"] = image;
    return _data;
  }
}