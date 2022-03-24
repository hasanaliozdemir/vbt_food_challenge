import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/contest_model.dart';

class ContestHomeService{

    mostPopularService() async {
      //zamana göre ayarlanacak
    var response = await FirebaseFirestore.instance.collection("contest").get();
    
    var mostPopularContest = response.docs.map((e)=>
      ContestModel.fromJson(e.data())).toList();
    return mostPopularContest;
  }

      isAwardContestService() async {
    var response = await FirebaseFirestore.instance.collection("contest").where("isaward", isEqualTo: true).get();
    
    var mostPopularContest = response.docs.map((e)=>
      ContestModel.fromJson(e.data())).toList();
    return mostPopularContest;
  }
  
}