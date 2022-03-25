import 'package:cloud_firestore/cloud_firestore.dart';

import '../../contestPage/model/contest_model.dart';
import '../model/foodModel.dart';

class FoodListService {
  getListFood() async {
    var response = await FirebaseFirestore.instance.collection("foods").get();

    var allFoods =
        response.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    return allFoods;
  }

  getMostLikedListFood() async {
    var response = await FirebaseFirestore.instance
        .collection("foods")
        .orderBy('rating')
        .get();

    var allFoods =
        response.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    List<FoodModel> reversedList = List.from(allFoods.reversed);
    return reversedList;
  }

  getFinishedContest() async {
    var response = await FirebaseFirestore.instance
        .collection("contest")
        .orderBy('endTime')
        .get();

    var allContest =
        response.docs.map((e) => ContestModel.fromJson(e.data())).toList();
    return allContest;
  }

  getUser(String ref) async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.doc(ref).get();
    return user.data()?['name'];
  }
}
