import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/contestpage_strings.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../../../core/widgets/category_container.dart';
import '../../../../../core/widgets/food_container.dart';
import '../../../../../product/widgets/appbar.dart';


class ContestPageView extends StatelessWidget {
  const ContestPageView({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {

    List<String> category= ["Tatlı","Ana yemek","Ara sıcak","Çorba","Salata"];
      TextStyle appbarTitleStyle = const TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
    String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";
    return Scaffold(
      appBar: header(context:context,name:"YARIŞMALAR",isback:false),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //En Beğeniler Tarifler
                   Container(
          height: context.height * 5 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CategoryTextContainerWidget(text: category[index],onpressed: (){print(index);},);
              }),
        ),
                  

                  _buildAwardContest(bodyTitleStyle, context, _url),

                  //Tamamlanan Yarışmalar
                  _buildMostPopular(bodyTitleStyle, _url),

                 

                  //Son Eklenen Tarifler

                 
                ],
              ),
            ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Column _buildMostPopular(TextStyle bodyTitleStyle, String _url) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: Text(
          ContestPageStrings.mostPopularTitle,
          style: bodyTitleStyle,
        ),
      ),
      Container(
       
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            //scrollDirection: Axis.vertical,
           physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageCardWidget(
                  height: context.height*25/100,
                  width: double.infinity,
                  url: _url,
                  foodName: "Iskender",
                  participants: 55,
                  isAdded: true,
                ),
              );
            }),
      ),
    ],
  );
  }

   



  Column _buildAwardContest(
      TextStyle bodyTitleStyle, BuildContext context, String _url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            ContestPageStrings.awardContestTitle,
            style: bodyTitleStyle,
          ),
        ),
        Container(
          height: context.height * 28 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                    url: _url,
                    width: context.width * 1.5 / 2,
                    foodName: "İskender",
                  ),
                );
              }),
        ),
      ],
    );
}
}