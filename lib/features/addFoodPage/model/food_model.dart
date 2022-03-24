import 'dart:convert';

import 'package:vbt_food_challange/features/addFoodPage/model/material_model.dart';

class FoodModel {
  String category;
  String name;
  List<String> imageUrls;
  String recipe;
  List<MaterialModel> materialList;
  String id;
  String userRef;
  String? contestRef;
  List<String>? comments;
  List<String>? likes;
  FoodModel({
    required this.category,
    required this.name,
    required this.imageUrls,
    required this.recipe,
    required this.materialList,
    required this.id,
    required this.userRef,
    this.contestRef,
    this.comments,
    this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'name': name,
      'imageUrls': imageUrls,
      'recipe': recipe,
      'materialList': materialList.map((x) => x.toMap()).toList(),
      'id': id,
      'userRef': userRef,
      'contestRef': contestRef,
      'comments': comments,
      'likes': likes,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      category: map['category'] ?? '',
      name: map['name'] ?? '',
      imageUrls: List<String>.from(map['imageUrls']),
      recipe: map['recipe'] ?? '',
      materialList: List<MaterialModel>.from(
          map['materialList']?.map((x) => MaterialModel.fromMap(x))),
      id: map['id'] ?? '',
      userRef: map['userRef'] ?? '',
      contestRef: map['contestRef'],
      comments: List<String>.from(map['comments']),
      likes: List<String>.from(map['likes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) =>
      FoodModel.fromMap(json.decode(source));
}
