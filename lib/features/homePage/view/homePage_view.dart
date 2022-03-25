import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/homepage_strings.dart';
import 'package:vbt_food_challange/core/widgets/food_container.dart';
import 'package:vbt_food_challange/features/contestPage/model/contest_model.dart';
import 'package:vbt_food_challange/features/contestPage/views/contestFinishedDetailPage/finishedContestPage.dart';
import 'package:vbt_food_challange/features/foodDetailPage/view/detail_view.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';
import 'package:vbt_food_challange/features/homePage/viewmodel/cubit/homepageview_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../product/widgets/appbar.dart';
import '../../../product/widgets/fab.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);

    return BlocProvider(
      create: (context) => HomePageViewCubit(),
      child: Scaffold(
        appBar: header(context: context, name: "Ana Sayfa", isback: false),
        bottomNavigationBar: const BottomNavbar(pageid: 0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const MyFAB(),
        body: BlocConsumer<HomePageViewCubit, HomePageViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            return context.read<HomePageViewCubit>().isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        //En Beğeniler Tarifler

                        _buildMostLikedRecipes(
                            bodyTitleStyle,
                            context,
                            context
                                .read<HomePageViewCubit>()
                                .mostLikedFoodList),

                        //Tamamlanan Yarışmalar

                        _buildFinishedContests(bodyTitleStyle, context,
                            context.read<HomePageViewCubit>().finishedContest),

                        //Son Eklenen Tarifler

                        _buildLastAddedRecipes(bodyTitleStyle, context,
                            context.read<HomePageViewCubit>().lastFoodList),
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
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              //scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                      height: context.height * 25 / 100,
                      width: double.infinity,
                      url: list?[index].imageUrls?[0] ?? "",
                      textisUp: true,
                      foodName: list?[index].name,
                      cooker: "Deniz",
                      onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailPageView(
                              foodModel: list?[index],
                            ),
                          ))),
                );
              }),
        ),
      ],
    );
  }

  Column _buildFinishedContests(TextStyle bodyTitleStyle, BuildContext context,
      List<ContestModel>? list) {
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
        SizedBox(
          height: context.height * 35 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                      url: list?[index].imageUrl ?? "null",
                      width: context.width * 1.2 / 2,
                      foodName: list?[index].name,
                      cooker: "Ayşe",
                      participants: 25,
                      onpressed: () {
                        //tamamlanan yarışmalara gidecek
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => FinishedContestPageView(
                                      model: list?[index],
                                      pageId: 0,
                                    ))));
                      }),
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
        SizedBox(
          height: context.height * 33 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                    url: list?[index].imageUrls?[0] ?? "",
                    width: context.width * 1.5 / 2,
                    foodName: list?[index].name,
                    rating: double.parse(list?[index].rating.toString() ?? "5"),
                    onpressed: () {
                      //food detail'e göndericek
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => FoodDetailPageView(
                                    foodModel: list?[index],
                                  ))));
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
