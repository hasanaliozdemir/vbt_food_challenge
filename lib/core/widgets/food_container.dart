import 'package:flutter/material.dart';
class ImageCardWidget extends StatelessWidget {
  final String url;
  double? height;
  double? width;
  String? foodName;
  String? cooker;
  double? rating;
  int? participants;
   ImageCardWidget({Key? key, required this.url,this.height,this.width,this.foodName,this.cooker,this.rating,this.participants}) : super(key: key);
 Color ratingColor = const Color.fromARGB(255, 255, 91, 91);
 TextStyle foodNameTextStyle = const TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  TextStyle cookerTextStyle = const TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??MediaQuery.of(context).size.width*1.7/2,
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
            height: height??MediaQuery.of(context).size.height/5,
            width: width??MediaQuery.of(context).size.width*1.7/2,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25)
            ),


          ),
          if(foodName!=null)Text(foodName.toString(),style:foodNameTextStyle,textAlign: TextAlign.start,),
          if(cooker!=null)Text("$foodName'in şefi $cooker hanımdan",style:cookerTextStyle,textAlign: TextAlign.start,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(rating!=null)Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 5,top: 5),
                width: width??MediaQuery.of(context).size.width*1.7/20,
                decoration: BoxDecoration(color:ratingColor ,
                borderRadius: BorderRadius.circular(6)),
                child: Center(child: Text(rating.toString(),style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
              ),
              if(participants!=null)Row(
                children: [
                  Icon(Icons.food_bank),
                  Text(participants.toString()+" kişi katıldı")
                ],
              )
            ],
          ),

        ], 
      ),
    );
  }
}