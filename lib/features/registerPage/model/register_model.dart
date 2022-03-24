import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterModel {
  String email;
  String name;
  String password;
  RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  static RegisterModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return RegisterModel(
      email: snapshot['email'],
      name: snapshot['name'],
      password: snapshot['password'],
    );
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));
}
