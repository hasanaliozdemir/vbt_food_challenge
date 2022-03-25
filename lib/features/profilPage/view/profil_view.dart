import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/core/widgets/food_container.dart';
import 'package:vbt_food_challange/features/foodDetailPage/view/detail_view.dart';
import 'package:vbt_food_challange/features/profilPage/model/userModel.dart';
import 'package:vbt_food_challange/features/profilPage/service/profile_service.dart';
import 'package:vbt_food_challange/features/profilPage/view/profile_your_receips_view.dart';
import 'package:vbt_food_challange/features/profilPage/view/saved_receips_view.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../product/widgets/fab.dart';
import '../../homePage/model/foodModel.dart';

class ProfilPageView extends StatefulWidget {
  const ProfilPageView({Key? key}) : super(key: key);

  @override
  State<ProfilPageView> createState() => _ProfilPageViewState();
}

class _ProfilPageViewState extends State<ProfilPageView> {
  List<FoodModel> favList = [];
  List<FoodModel> myList = [];

  late UserModel _currentUser;
  bool _isLoading = true;
  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  _getUserData() async {
    _currentUser = await ProfileService().getUser();
    for (var i = 0; i < _currentUser.favoriteFoods!.length; i++) {
      var _data = await _currentUser.favoriteFoods![i].get();
      favList.add(FoodModel.fromJson(_data.data()));
    }

    for (var i = 0; i < _currentUser.addedFoods!.length; i++) {
      var _data = await _currentUser.addedFoods![i].get();
      myList.add(FoodModel.fromJson(_data.data()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(context),
      bottomNavigationBar: const BottomNavbar(pageid: 3),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyFAB(),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 15,
        ),
        Expanded(flex: 150, child: _buildProfileCard()),
        const Spacer(
          flex: 34,
        ),
        Expanded(
          flex: 220,
          child: _buildAchivementCard(context),
        ),
        const Spacer(
          flex: 21,
        ),
        Expanded(
          flex: 160,
          child: _buildSavedReceips(context),
        ),
        Expanded(
          flex: 160,
          child: _buildYourReceips(context),
        ),
      ],
    );
  }

  Column _buildYourReceips(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tariflerin",
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors().red),
            ),
            const Spacer(),
            SizedBox(
              height: context.dynamicHeight(0.03),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              YourReceipsView(foods: myList)));
                },
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors().red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.paddingLow.top,
        ),
        _buildReceipRow(context, myList)
      ],
    );
  }

  Column _buildSavedReceips(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Kaydettiğin Tarifler",
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors().red),
            ),
            const Spacer(),
            SizedBox(
              height: context.dynamicHeight(0.03),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SavedReceipsView(foods: favList)));
                },
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors().red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.paddingLow.top,
        ),
        _buildReceipRow(context, favList)
      ],
    );
  }

  SingleChildScrollView _buildReceipRow(
      BuildContext context, List<FoodModel> foodsList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(foodsList.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.paddingLow.right),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FoodDetailPageView(foodModel: foodsList[index])));
              },
              child: SizedBox(
                width: context.dynamicWidth(0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        foodsList[index].name ?? "",
                        maxLines: 1,
                        style: TextStyle(fontSize: context.dynamicWidth(0.03)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: AppColors().demonicyellow,
                          size: context.dynamicWidth(0.03),
                        );
                      }),
                    ),
                    ImageCardWidget(
                      height: context.dynamicHeight(0.08),
                      width: context.dynamicWidth(0.3),
                      url: foodsList[index].imageUrls!.first,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Container _buildAchivementCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius, color: AppColors().red),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(8, (index) {
            return _buildAchivement(context);
          }),
        ),
      ),
    );
  }

  Padding _buildAchivement(BuildContext context) {
    return Padding(
      padding: context.paddingLow.copyWith(top: context.paddingLow.top * 1.5),
      child: Container(
        width: context.dynamicWidth(0.15),
        height: context.dynamicHeight(0.1),
        decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            color: AppColors().lead.withOpacity(0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.awardsaplus.com/wp-content/uploads/2016/08/ICON_achievement-icon.png"),
              ),
            ),
            SizedBox(
              height: context.paddingLow.top,
            ),
            Icon(
              Icons.star,
              color: AppColors().demonicyellow,
            )
          ],
        ),
      ),
    );
  }

  Row _buildProfileCard() {
    return Row(
      children: [
        const Expanded(
            child: FittedBox(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/68190862?v=4"),
          ),
        )),
        Expanded(
            child: Column(
          children: [
            Expanded(child: FittedBox(child: Text(_currentUser.name ?? ""))),
            const Spacer(),
            const Expanded(child: FittedBox(child: const Text("Level 2"))),
            const Expanded(child: FittedBox(child: Text("Patlıcan Adam"))),
          ],
        ))
      ],
    );
  }
}
