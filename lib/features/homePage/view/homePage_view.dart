import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/homepage_strings.dart';
import 'package:vbt_food_challange/core/widgets/food_container.dart';
import 'package:vbt_food_challange/features/addFoodPage/viewmodel/cubit/foodadd_cubit.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';
import 'package:vbt_food_challange/features/homePage/service/foodList_Service.dart';
import 'package:vbt_food_challange/features/homePage/viewmodel/cubit/homepageview_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/widgets/appbar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context){
     
    
     TextStyle appbarTitleStyle = const TextStyle(

        fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
    String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";


    return BlocProvider(
      create: (context) => HomePageViewCubit(),
      child: Scaffold(
        appBar: header(context:context,name:"Ana Sayfa",isback:false),
         bottomNavigationBar: BottomNavbar(pageid:0),
        body: BlocConsumer<HomePageViewCubit, HomePageViewState>(
          listener: (context, state) {
           
          },

          builder: (context, state) {
            return context.read<HomePageViewCubit>().isLoading?Center(child: CircularProgressIndicator(),):
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //En Beğeniler Tarifler
                 
               

                  _buildMostLikedRecipes(bodyTitleStyle, context, context.read<HomePageViewCubit>().mostLikedFoodList),

                  //Tamamlanan Yarışmalar

                  _buildFinishedContests(bodyTitleStyle, context, _url),

                  //Son Eklenen Tarifler

                  _buildLastAddedRecipes(bodyTitleStyle, context, context.read<HomePageViewCubit>().lastFoodList),
                ],
              ),
            );
          },
        ),
       
      ),
    );
  }

  Column _buildLastAddedRecipes(
      TextStyle bodyTitleStyle, BuildContext context, List<FoodModel>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            HomePageStrings.lastAddedFoodTitle,
            style: bodyTitleStyle,
          ),
        ),
        Container(
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              //scrollDirection: Axis.vertical,
             physics: NeverScrollableScrollPhysics(),
              itemCount: list?.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                    height: context.height * 25 / 100,
                    width: double.infinity,
                    url: list?[index].imageUrls?[0],
                    textisUp: true,
                    foodName: list?[index].name,
                    cooker:"Ayşe ",
                  ),
                );
              }),
        ),
      ],
    );
  }

  Column _buildFinishedContests(
      TextStyle bodyTitleStyle, BuildContext context, String _url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            HomePageStrings.finishedContest,
            style: bodyTitleStyle,
          ),
        ),
        Container(
          height: context.height * 35 / 100,
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
                    width: context.width * 1.2 / 2,
                    foodName: "İskender",
                    cooker: "Ayşe",
                    rating: 4.5,
                    participants: 25,
                    onpressed: (){
                      //tamamlanan yarışmalara gidecek
                      Navigator.pushNamed(context, "/finishContestDetail");
                      }
                  ),
                );
              }),
        ),
      ],
    );
  }

  Column _buildMostLikedRecipes(
      TextStyle bodyTitleStyle, BuildContext context, List<FoodModel>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            HomePageStrings.mostLikedTitle,
            style: bodyTitleStyle,
          ),
        ),
        Container(
          height: context.height * 28 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                    url: list?[index].imageUrls?[0],
                    width: context.width * 1.5 / 2,
                    foodName: list?[index].name,
                    onpressed: (){
                      //food detail'e göndericek
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
