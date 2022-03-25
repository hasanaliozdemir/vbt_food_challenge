// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

class CommentModel {
  CommentModel({this.addTime, this.comment, this.point, this.user_uid});
  String? comment;
  Timestamp? addTime;
  int? point;
  String? user_uid;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        comment: json["comment"],
        addTime: json["addTime"],
        point: json['point'],
        user_uid: json['user_uid'],
      );
}

class MaterialModel {
  MaterialModel({required this.name, required this.amount});
  String? name;
  String? amount;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
        name: json["name"],
        amount: json["amount"],
      );
}

class ContestModel {
  ContestModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.description,
    this.participant,
    this.badgeUrl,
    this.startTime,
    this.endTime,
    this.addTime,
    this.winner,
    this.contestFoods,
  });
  String? id;
  String? name;
  String? category;
  String? imageUrl;
  String? description;
  List<dynamic>? participant;
  String? badgeUrl;
  Timestamp? startTime;
  Timestamp? endTime;
  Timestamp? addTime;
  DocumentReference? winner;
  List<FoodModel>? contestFoods;

  ContestModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    category = json["category"];
    imageUrl = json["imageUrl"];
    participant = json['participant'];
    badgeUrl = json["badgeUrl"];
    description = json['description'];
    startTime = json["startTime"];
    endTime = json["endTime"];
    addTime = json["addTime"];
    winner = json['winner'];
    contestFoods = List.generate(json['contestFoods']?.length ?? 0,
        (index) => FoodModel.fromJson(json['contestFoods'][index]));

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
  }
}
