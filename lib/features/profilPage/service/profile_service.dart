import 'package:cloud_firestore/cloud_firestore.dart';

import '../../homePage/model/foodModel.dart';

class ProfileService {


  getUser(String ref) async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.doc(ref).get();
    print(user.data());
    return user.data()?['name'];
  }

  getListFood() async {
    var response = await FirebaseFirestore.instance.collection("foods").get();

    var allFoods =
        response.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    return allFoods;
  }

  orderFoods() async {
    List<FoodModel> _allReceips = await getListFood();
    List<FoodModel> _savedRecipes = [];
    List<FoodModel> _userRecipes = [];

    _allReceips.forEach((recipe) { 
      
    });
  }


}
