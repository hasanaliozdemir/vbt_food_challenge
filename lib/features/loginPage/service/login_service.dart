import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final _firabaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await _firabaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  Stream<User?> authStatus() {
    return _firabaseAuth.authStateChanges();
  }
}
