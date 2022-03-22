import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/homepage_strings.dart';
import 'package:vbt_food_challange/core/widgets/food_container.dart';
import 'package:vbt_food_challange/features/homePage/service/foodList_Service.dart';
import 'package:vbt_food_challange/features/homePage/viewmodel/cubit/homepageview_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
    String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";
    return BlocProvider(
      create: (context) => HomePageViewCubit(),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              HomePageStrings.title,
              style: bodyTitleStyle,
            )),
        body: BlocConsumer<HomePageViewCubit, HomePageViewState>(
          listener: (context, state) {
            
          },
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //En Beğeniler Tarifler

                  _buildMostLikedRecipes(bodyTitleStyle, context, _url),

                  //Tamamlanan Yarışmalar

                  _buildFinishedContests(bodyTitleStyle, context, _url),

                  //Son Eklenen Tarifler

                  _buildLastAddedRecipes(bodyTitleStyle, context, _url),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }

  Column _buildLastAddedRecipes(
      TextStyle bodyTitleStyle, BuildContext context, String _url) {
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
                    textisUp: true,
                    foodName: "Iskender",
                    participants: 25,
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
                  ),
                );
              }),
        ),
      ],
    );
  }

  Column _buildMostLikedRecipes(
      TextStyle bodyTitleStyle, BuildContext context, String _url) {
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
