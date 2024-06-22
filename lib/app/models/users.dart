// ignore_for_file: prefer_collection_literals, unnecessary_this

class UsersModel {
  String? email;

  UsersModel({this.email});

  UsersModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}
