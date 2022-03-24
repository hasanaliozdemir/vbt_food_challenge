import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<FoodModel> foodModelFromJson(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

class FoodModel {
  FoodModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrls,
      required this.recipe,
      required this.rating,
      required this.contestRef,
      required this.userRef,
      this.commentList,
      this.materials
      });
  int? id;
  String? name;
  String? category;
  List<dynamic>? imageUrls;
  String? recipe;
  String? rating;
  dynamic contestRef;
  dynamic userRef;
  List<CommentModel>? commentList;
  List<MaterialModel>? materials;

  FoodModel.fromJson(Map<String, dynamic> json) {
    var _imageData;
    if (json["imageUrls"] is String) {
      _imageData = [json["imageUrls"]];
    }else{
      _imageData = json["imageUrls"];
    }

    id = json["id"];
    name = json["name"];
    category = json["category"];
    imageUrls = _imageData;
    recipe = json["recipe"];
    rating = json["rating"];
    contestRef = json["contestRef"];
    userRef = json['userRef'];
    commentList =
        List.generate(json['comments']?.length ?? 0, (index) => CommentModel.fromJson(json['comments'][index]));
    materials =
        List.generate(json['materials']?.length ?? 0, (index) => MaterialModel.fromJson(json['materials'][index]));
  }

//     factory FoodModel.fromFirestore(QuerySnapshot<Object?> doc) {

  // var data = doc.();

//     return FoodModel(
//         id: data["id"],
//         name: data?["name"]??"",
//         category: data?["category"]??"",
//         imageUrls: data?["imageUrls"]??"",
//         recipe: data?["recipe"]??"",
//         rating: data?["rating"]??"",
//         contestRef: data?["contestRef"]??"",
//         commentList: data?["commentList"]??"",
//         materials: data?["materials"]??"",
//     );
// }

  // Map<String, dynamic> toJson() => {
  //     "userId": userId,
  //     "id": id,
  //     "title": title,
  // };

}
class CommentModel{
  CommentModel({this.addTime,this.point,this.user_uid});
  // String? comment;
  Timestamp? addTime;
  int? point;
  String? user_uid;
  

   factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
       
        // comment: json["comment"],
        addTime: json["addtime"],
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



