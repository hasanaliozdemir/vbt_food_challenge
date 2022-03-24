import 'package:cloud_firestore/cloud_firestore.dart';

class FinishContestPageService{
  


 

   getWinner(String ref) async {
    var response = await FirebaseFirestore.instance.doc(ref).get();
    
  
    return response;
  }

}