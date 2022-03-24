import 'dart:convert';

class LoginModel {
  String? password;
  String? email;
  LoginModel({
    this.password,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      password: map['password'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
