import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';

class LoginService {
  final _firabaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signInWithEmailAndPassword({required BuildContext context,required String email,required String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _firabaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("başarılı");
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomePageView()), (route) => false);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('User not found');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password');
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
Future signIn({required BuildContext context,required String? email,required String? password}) async {
    try {
      //Giriş Yapıldı
      await _firabaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      print("Giriş Yapıldı " +
          FirebaseAuth.instance.currentUser!.email.toString());
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomePageView()), (route) => false);
      
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }                            

  Stream<User?> authStatus() {
    return _firabaseAuth.authStateChanges();
  }
}
