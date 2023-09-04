class HomeModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {

    banners = json["banners"] == null ? null : (json["banners"] as List).map((e) => Banners.fromJson(e)).toList();
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    ad = json["ad"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(banners != null) {
      _data["banners"] = banners?.map((e) => e.toJson()).toList();
    }
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["ad"] = ad;
    return _data;
  }
}

class Products {
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products({this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description, this.images, this.inFavorites, this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    inFavorites = json["in_favorites"];
    inCart = json["in_cart"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["price"] = price;
    _data["old_price"] = oldPrice;
    _data["discount"] = discount;
    _data["image"] = image;
    _data["name"] = name;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images;
    }
    _data["in_favorites"] = inFavorites;
    _data["in_cart"] = inCart;
    return _data;
  }
}

class Banners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    category = json["category"];
    product = json["product"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["category"] = category;
    _data["product"] = product;
    return _data;
  }
}