import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/contestDetail_strings.dart';
import 'package:vbt_food_challange/core/constant/strings/contestFinishDetail_strings.dart';
import 'package:vbt_food_challange/core/constant/strings/contestpage_strings.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../../../core/widgets/category_container.dart';
import '../../../../../core/widgets/food_container.dart';
import '../../../../../product/widgets/appbar.dart';
import '../../../../core/theme/color/color_theme.dart';
import '../../model/contest_model.dart';

//kazanan kişi eklenecek
class FinishedContestPageView extends StatelessWidget {
  final ContestModel? model;
  const FinishedContestPageView({Key? key,required this.model}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
      bool isDark = Theme.of(context).brightness == Brightness.dark;
  
      TextStyle? appbarTitleStyle =  Theme.of(context).textTheme.headline5?.copyWith(
                
                  color: isDark ? AppColors().white : AppColors().black,
                  fontWeight: FontWeight.bold,);

    TextStyle? bodyTitleStyle =  Theme.of(context).textTheme.headline5?.copyWith(
                
                  color: isDark ? AppColors().white : AppColors().black,
                  fontWeight: FontWeight.bold,);
        
        TextStyle kalanTimeTextStyle = const TextStyle(
      color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold);

      

      TextStyle? bodyTextStyle=Theme.of(context).textTheme.bodyText1?.copyWith(
        color:isDark ? AppColors().white : AppColors().black,);

    return Scaffold(
      appBar: header(context:context,name:model?.name??"",isback:true),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: model!=null?Column(
                children: [
                      

                  _buildImageOfContest(kalanTimeTextStyle, context,model?.imageUrl?[0]??""),
                  
                  _buildMiddleContent(appbarTitleStyle, bodyTitleStyle,bodyTextStyle),
                  //Tamamlanan Yarışmalar
                  _participantRecipe(bodyTitleStyle, model?.imageUrl?[0]??""),

                 

                  //Son Eklenen Tarifler

                 
                ],
              ):Center(child:Text("Not Found")),
            ),
      bottomNavigationBar: BottomNavbar(pageid:2),
    );
  }

  Padding _buildMiddleContent(TextStyle? appbarTitleStyle, TextStyle? bodyTitleStyle,TextStyle? bodyTextStyle) {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(ContestFinishedDetailPageStrings.kazanilacakRozet,style: appbarTitleStyle,),
                      Padding(
                        padding: const EdgeInsets.only(bottom:16.0),
                        child: Icon(Icons.badge,size: 50,color: Colors.pink,),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(ContestFinishedDetailPageStrings.descriptionTitle,style: bodyTitleStyle,)),
                      Text(model?.description??"",textAlign: TextAlign.center,style: bodyTextStyle)
                    ],
                  ),
                );
  }

  Column _participantRecipe(TextStyle? bodyTitleStyle, String _url) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: Text(
          ContestDetailPageStrings.participantTitle,
          style: bodyTitleStyle,
        ),
      ),

      //Future Builder ile çevrelenip yarışmaya katılanlar
      Container(
        
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
           physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageCardWidget(
                      height: context.height*15/100,
                      width: context.width*1.2/3,
                      url: _url,
                     
                    ),
                  ),
                  Column(children: [
                    Text("Ayşe hanım"),
                    
                  ],)
                ],
              );
            }),
      ),
    ],
  );
  }

   



  Padding _buildImageOfContest(
      TextStyle kalanTimeTextStyle, BuildContext context, String _url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          
                  
                     
                     
                        ImageCardWidget(
                         height: context.height/4,
                        url: _url,
                        width: context.width,
                       
                    ),
                     
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(ContestFinishedDetailPageStrings.finishTimeText,style: kalanTimeTextStyle,),
                         Text(ContestFinishedDetailPageStrings.participantNumber+" kişi katıldı",style: kalanTimeTextStyle,)

                       ],
                     )
                  
      
        ],
      ),
    );
}
}