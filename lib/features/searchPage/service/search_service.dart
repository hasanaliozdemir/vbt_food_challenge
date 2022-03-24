import 'package:cloud_firestore/cloud_firestore.dart';

import '../../homePage/model/foodModel.dart';



class SearchService {
  getListFood() async {
    var response = await FirebaseFirestore.instance.collection("foods").get();

    var allFoods =
        response.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    return allFoods;
  }

  
}