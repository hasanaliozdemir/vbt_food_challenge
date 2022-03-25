import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vbt_food_challange/features/profilPage/model/userModel.dart';

class ProfileService {
  final _uid = FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  getUser() async {
    var user = await _firebaseFirestore.doc("/users/$_uid").get();
    return UserModel.fromJson(user.data()!);
  }
}
