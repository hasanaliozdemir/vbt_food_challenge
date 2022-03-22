import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FoodListService{


 final CollectionReference _foodList=FirebaseFirestore.instance.collection("/foods");
 Future<Stream<QuerySnapshot<Object?>>> getFoods()async{
   var response = await _foodList.snapshots();
   response.toString();
   return response;
 } 
}