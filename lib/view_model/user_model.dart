import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String userId, email, name, phone;

  UserModel(
    this.email,
    this.name,
    this.userId,
    this.phone,
  );

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"];
    email = map["email"];
    phone = map["phone"];
  }
  toJson() {
    return {"userId": userId, "email": email, "name": name, "phone": phone};
  }
}
