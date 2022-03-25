import 'dart:convert';

import 'package:vbt_food_challange/features/addFoodPage/model/material_model.dart';

class FoodModel {
  String category;
  String name;
  List<String> imageUrls;
  String recipe;
  List<MaterialModel> materials;
  int id;
  String userRef;
  String rating;
  String? contestRef;
  List<String>? comments;

  FoodModel({
    required this.category,
    required this.name,
    required this.imageUrls,
    required this.recipe,
    required this.materials,
    this.id = 0,
    required this.userRef,
    this.contestRef,
    this.comments,
    this.rating = '2',
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'name': name,
      'imageUrls': imageUrls,
      'recipe': recipe,
      'materials': materials.map((x) => x.toMap()).toList(),
      'id': id,
      'userRef': userRef,
      'contestRef': contestRef,
      'comments': comments,
      'rating': rating,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      category: map['category'] ?? '',
      name: map['name'] ?? '',
      imageUrls: List<String>.from(map['imageUrls']),
      recipe: map['recipe'] ?? '',
      materials: List<MaterialModel>.from(
          map['materials']?.map((x) => MaterialModel.fromMap(x))),
      id: map['id'] ?? '',
      userRef: map['userRef'] ?? '',
      contestRef: map['contestRef'],
      comments: List<String>.from(map['comments']),
      rating: map['rating'] ?? '2',
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(
        json.decode(source),
      );
}
