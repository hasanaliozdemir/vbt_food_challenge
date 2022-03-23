
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';


List<ContestModel> ContestModelFromJson(String str) => List<ContestModel>.from(json.decode(str).map((x) => ContestModel.fromJson(x)));


class ContestModel {
    ContestModel({
        this.id,
        this.name,
        this.category,
        this.imageUrl,
        this.description,
       // this.participant,
        this.badgeUrl,
        this.startTime,
        this.endTime,
        this.addTime,
        this.winner,
        this.contestFoods,
    });
    int? id;
    String? name;
    String? category;
    List<String>? imageUrl;
    String? description;
   // List<UserModel?>? participant;
    String? badgeUrl;
    Timestamp? startTime;
    Timestamp? endTime;
    Timestamp? addTime;
    String? winner;
    List<FoodModel>? contestFoods;
    
    
   
    
   


    factory ContestModel.fromJson(Map<String, dynamic> json) => ContestModel(
       
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: json["imageUrl"],
      //  participant: json["participant"],
        badgeUrl: json["badgeUrl"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        addTime: json["addTime"],
        winner:json['winner'],
        //contestFoods: FoodModel.fromFirestore(json),
      
    );

//     factory ContestModel.fromFirestore(DocumentSnapshot? doc) {
      
//     var data = doc?.data.data();


//     return ContestModel(
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

final List contests=[ContestModel(
             id:0,
             name:"KarnıYarık",
             category: "Ana Yemek",
             imageUrl: ["https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg"],
             description: "Karnı Yarık Yapmak ister misin ?",
             badgeUrl: "https://i.pinimg.com/originals/3b/34/22/3b342214e29ffec9de07a9a015375cac.png",
             
         ) ];
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
  MaterialModel({required this.name,required this.amount});
  String? name;
  String? amount;
  

   factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
       
        name: json["name"],
        amount: json["amount"],
       
       
      
    );
 
}



