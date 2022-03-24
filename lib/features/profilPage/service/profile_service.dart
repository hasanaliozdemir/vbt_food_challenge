import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  getUser()async{
   
   var user= await _firebaseFirestore.doc("/users/fG64ece1sdXeqiqXUXekEPCm9Pz2").get();
    print(user.data().toString());
  }
}