import 'dart:convert';

class MaterialModel {
  String amount;
  String name;
  MaterialModel({
    required this.amount,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'name': name,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      amount: map['amount'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source));
}