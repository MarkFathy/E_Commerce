
class LogOutModel {
  bool? status;
  String? message;
  Data? data;

  LogOutModel({this.status, this.message, this.data});

  LogOutModel.fromJson(Map<String, dynamic> json) {
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
  String? token;

  Data({this.id, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["token"] = token;
    return _data;
  }
}