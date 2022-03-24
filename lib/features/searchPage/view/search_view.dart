import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:vbt_food_challange/core/constant/strings/searchpage_strings.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/features/searchPage/model/cateory_card_model.dart';
import 'package:vbt_food_challange/features/searchPage/viewModel/search_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageView extends StatelessWidget {
  SearchPageView({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  List<CategoryCardModel> categories = [
    CategoryCardModel("Çorba", false),
    CategoryCardModel("Ana Yemek", false),
    CategoryCardModel("Ara Sıcak", false),
    CategoryCardModel("Tatlı", false),
    CategoryCardModel("İçecek", false),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPageCubit(),
      child: BlocConsumer<SearchPageCubit, SearchPageState>(
        listener: (context, state) {
          if (state is SearchPageErrorState) {}
        },
        builder: (context, state) {
          return _buildScaffold(context);
        },
      ),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(pageid:1),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [_buildTitle(), const Spacer(), _buildShuffle(context)],
            ),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          _buildSearchBar(context),
          SizedBox(
            height: context.height * 0.03,
          ),
          _buildCategories(context)
        ],
      ),
    );
  }

  _buildTitle() {
    return // Tarif Ara
         Text(SearchPageStrings().searchTitleText,
            style: TextStyle(
                color: AppColors().red,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 24.0),
            textAlign: TextAlign.center);
  }

  _buildShuffle(BuildContext context) {
    return // Rectangle 290
        Row(
          children: [
            Text("Çarkı Çevir"),
            Container(
              
                width: context.dynamicWidth(0.2),
                height: 38,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                   
                   ),
                   child: InkWell(
                     onTap: (){
          print("çarka tıklandı");
        },
                     child: Lottie.asset('assets/lotties/wheel.json')),
                   ),
          ],
        );
  }

  _buildSearchBar(BuildContext context) {
    return // Rectangle 284
        Container(
      width: 322,
      height: 44,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          color: Color(0xfff0f0f0)),
      child: Padding(
        padding: context.paddingLow.copyWith(
            bottom: 0,
            left: context.paddingLow.left * 2,
            right: context.paddingLow.right * 2),
        child: TextField(
          onChanged: (val) => _searchItems(val),
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: SearchPageStrings().searchHintText,
            suffixIcon: Icon(
              Icons.search,
              color: AppColors().red,
            ),
          ),
          cursorColor: AppColors().lead,
          style: TextStyle(color: AppColors().black),
        ),
      ),
    );
  }

  _buildCategories(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.paddingLow.left),
            child: InkWell(
              onTap: () => _selectCategorie(index),
              child: Container(
                decoration: BoxDecoration(
                  color: (categories[index].selected)
                      ? AppColors().red
                      : AppColors().red.withOpacity(0.4),
                  borderRadius: context.normalBorderRadius,
                ),
                child: Padding(
                  padding: context.paddingLow.copyWith(
                    right: context.paddingLow.right * 2,
                    left: context.paddingLow.left * 2,
                  ),
                  child: Center(
                    child: Text(
                      categories[index].category,
                      style: TextStyle(
                        color: AppColors().black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _searchItems(String val) {}

  _selectCategorie(index) {
    categories[index].selected = !categories[index].selected;
  }
}
