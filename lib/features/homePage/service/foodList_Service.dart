import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/foodModel.dart';

class FoodListService{


 final CollectionReference _foodList=FirebaseFirestore.instance.collection("/foods");
 final DocumentReference _foodOne =FirebaseFirestore.instance.doc("/foods/K5Gz9ErlFomC6IaQ7rgF");
 getOneFood()async{
   DocumentSnapshot response =await _foodOne.get();
   //print(response.data().toString());
   //FoodModel a =FoodModel.fromFirestore(response);
   //print("kategori : "+a.name.toString());
 
 }
}