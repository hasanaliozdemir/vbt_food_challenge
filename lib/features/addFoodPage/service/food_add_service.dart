import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:vbt_food_challange/core/resources/storages_methods.dart';
import 'package:vbt_food_challange/features/addFoodPage/model/food_model.dart';

class FoodAddService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadFood(FoodModel foodModel, File file) async {
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('foods', file);
      foodModel.imageUrls.add(photoUrl);
      String id = const Uuid().v1();
      //foodModel.id = id;

      _firestore.collection('foods').doc(id).set(foodModel.toMap());
    } catch (e) {
      rethrow;
    }

    return;
  }
}
