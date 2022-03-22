
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));
class FoodModel {
    FoodModel({
        this.id,
        this.name,
        this.category,
        this.imageUrls,
        this.recipe,
        this.rating,
        this.contestRef,
        this.commentList,
        this.materials
    });
    int? id;
    String? name;
    String? category;
    List<String>? imageUrls;
    String? recipe;
    String? rating;
    String? contestRef;
    List<CommentModel?>? commentList;
    List<MaterialModel?>? materials;
    
    
   
    
   


    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
       
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrls: json["imageUrls"],
        recipe: json["recipe"],
        rating: json["rating"],
        contestRef: json["contestRef"],
        commentList: json["commentList"],
        materials: json["materials"],
      
    );

//     factory FoodModel.fromFirestore(DocumentSnapshot? doc) {
      
//     var data = doc?.data.data();


//     return FoodModel(
//         id: data["id"],
//         name: data["name"],
//         category: data["category"],
//         imageUrls: data["imageUrls"],
//         recipe: data["recipe"],
//         rating: data["rating"],
//         contestRef: data["contestRef"],
//         commentList: data["commentList"],
//         materials: data["materials"],
//     );
// }

    // Map<String, dynamic> toJson() => {
    //     "userId": userId,
    //     "id": id,
    //     "title": title,
    // };


}
class CommentModel{
  CommentModel({this.addTime,this.comment,this.point,this.user_uid});
  String? comment;
  Timestamp? addTime;
  int? point;
  String? user_uid;
  

   factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
       
        comment: json["comment"],
        addTime: json["addTime"],
        point:json['point'],
        user_uid:json['user_uid'],
       
      
    );
 
}

class MaterialModel{
  MaterialModel({this.name,this.amount});
  String? name;
  String? amount;
  

   factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
       
        name: json["name"],
        amount: json["amount"],
       
       
      
    );
 
}



