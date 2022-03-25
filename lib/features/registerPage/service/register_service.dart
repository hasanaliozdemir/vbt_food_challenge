import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  final _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUp(
      {required String? name,
      required String? email,
      required String? password}) async {
    try {
      UserCredential? userCredential;
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      await _firestore
          .collection("users")
          .doc(userCredential.user?.uid ?? '')
          .set({
        'name': name,
        'email': email,
        'addedFoods': [],
        'favoriteFoods': [],
        'competitionsWon': [],
      });
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email already in use');
      } else if (e.code == 'weak-password') {
        throw Exception('Weak password');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUser(
    String name,
    String email,
    String password,
  ) async {
    UserCredential userCredential;

    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore
          .collection("users")
          .doc(userCredential.user?.uid ?? '')
          .set({
        'name': name,
        'email': email,
        'password': password,
        'addedFoods': [],
        'favoriteFoods': [],
        'competitionsWon': [],
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email already in use');
      } else if (e.code == 'weak-password') {
        throw Exception('Weak password');
      }
    } catch (e) {
      rethrow;
    }
  }
}
