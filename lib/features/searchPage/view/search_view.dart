import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:vbt_food_challange/core/constant/strings/searchpage_strings.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/features/foodDetailPage/view/detail_view.dart';
import 'package:vbt_food_challange/features/searchPage/model/cateory_card_model.dart';
import 'package:vbt_food_challange/features/searchPage/service/search_service.dart';
import 'package:vbt_food_challange/features/searchPage/viewModel/search_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

import '../../../product/widgets/fab.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  StreamController<int> controller = StreamController<int>.broadcast();
  final TextEditingController _searchController = TextEditingController();

  List<CategoryCardModel> categories = [
    CategoryCardModel("Çorba", false),
    CategoryCardModel("Ana Yemek", false),
    CategoryCardModel("Ara Sıcak", false),
    CategoryCardModel("Tatlı", false),
    CategoryCardModel("İçecek", false),
    CategoryCardModel("Salata", false),
  ];

  final List<CategoryCardModel> _selectedCategories = [];

  // ignore: prefer_final_fields, unused_field
  List<FoodModel> _searchResults = [];

  List<FoodModel> _allFoods = [];
  List<FoodModel> _matchingList = [];

  bool _isLoadingPage = true;
  bool _isLoading = false;

  _getFoods() async {
    _allFoods = await SearchService().getListFood();
    _matchingList = _allFoods.toList();
    setState(() {
      _isLoadingPage = false;
    });
  }

  @override
  void initState() {
    _getFoods();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

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
      bottomNavigationBar: const BottomNavbar(pageid: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyFAB(),
      body: (_isLoadingPage)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildTitle(),
                        const Spacer(),
                        _buildShuffle(context)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  _buildSearchBar(context),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  _buildCategories(context),
                  _buildSearchItems()
                ],
              ),
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
        const Text("Çarkı Çevir"),
        Container(
          width: context.dynamicWidth(0.2),
          height: 38,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: InkWell(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      _allFoods.shuffle();
                      var _whellItems = List.generate(
                          (_allFoods.length < 10) ? _allFoods.length : 10,
                          (index) {
                        return FortuneItem(
                            child: FittedBox(
                              child: Text(
                                "    " + _allFoods[index].name!,
                                style: TextStyle(
                                    color: (index % 2 == 0)
                                        ? AppColors().black
                                        : AppColors().darkGrey),
                              ),
                            ),
                            style: FortuneItemStyle(
                              color: (index % 2 == 0)
                                  ? AppColors().demonicyellow.withOpacity(0.4)
                                  : AppColors().red.withOpacity(0.4),
                            ));
                      });
                      var _selectedIndex = 0;
                      bool _isTurned = false;
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          contentPadding: const EdgeInsets.all(0),
                          content: SizedBox(
                            width: context.dynamicWidth(0.8),
                            height: context.dynamicHeight(0.6),
                            child: Column(
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: context.paddingLow.bottom),
                                    child: FortuneWheel(
                                      animateFirst: false,
                                      selected: controller.stream,
                                      items: _whellItems,
                                      onFling: () {
                                        int value = Random().nextInt(10);
                                        controller.add(value);
                                        _selectedIndex = value;
                                      },
                                      onAnimationEnd: () {
                                        setState(() {
                                          _isTurned = true;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.paddingLow.bottom),
                                    child: Center(
                                      child: Text(
                                        "Şanslı Tarifin Yükleniyor",
                                        style: TextStyle(
                                            fontSize:
                                                context.dynamicWidth(0.05)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: (_isTurned)
                                        ? FittedBox(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      _allFoods[_selectedIndex]
                                                          .imageUrls!
                                                          .first),
                                                ),
                                                SizedBox(
                                                  width:
                                                      context.paddingLow.right,
                                                ),
                                                Text(_allFoods[_selectedIndex]
                                                    .name!),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Close",
                                          style: TextStyle(
                                              color: AppColors().white),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_isTurned) {
                                            Navigator.pop(context);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      FoodDetailPageView(
                                                    foodModel: _allFoods[
                                                        _selectedIndex],
                                                  ),
                                                ));
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: (_isTurned)
                                              ? MaterialStateProperty.all<
                                                  Color>(AppColors().redremains)
                                              : MaterialStateProperty
                                                  .all<Color>(AppColors()
                                                      .redremains
                                                      .withOpacity(0.6)),
                                        ),
                                        child: Text(
                                          "Go to Recepie",
                                          style: TextStyle(
                                              color: AppColors().black),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    });
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
          style: Theme.of(context).textTheme.bodyText1,
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

  _buildSearchItems() {
    return Padding(
      padding: context.paddingNormal,
      child: SizedBox(
        height: context.dynamicHeight(0.520),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: (_isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _matchingList.length,
                  itemBuilder: (context, index) {
                    var _item = _matchingList[index];
                    return Padding(
                      padding: context.paddingLow,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors().redremains,
                            borderRadius: context.normalBorderRadius),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(_item.imageUrls?.first),
                          ),
                          title: Text(_item.name ?? "Yükleniyor..."),
                          trailing: IconButton(
                            icon: Icon(Icons.chevron_right,
                                color: AppColors().red),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDetailPageView(
                                          foodModel: _item)));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  _searchItems(String val) {
    if (val == "null" || val == "") {
      _matchingList = _allFoods.toList();
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
      _matchingList.clear();
      _matchingList.addAll(_allFoods.where((element) =>
          element.name!.toLowerCase().contains(val.toLowerCase()) == true));
      for (var recepie in _allFoods) {
        recepie.materials?.forEach((material) {
          if (material.name!.toLowerCase().contains(val.toLowerCase())) {
            _matchingList.add(recepie);
          }
        });
      }
      _matchingList = _matchingList.toSet().toList();
      _orderMatchesByCategories(val);
      setState(() {
        _isLoading = false;
      });
    }
  }

  _selectCategorie(index) {
    if (_selectedCategories.isNotEmpty) {
      if (categories[index].category == _selectedCategories.first.category) {
        setState(() {
          categories[index].selected = false;
          _selectedCategories.remove(categories[index]);
          _matchingList = _allFoods.toList();
        });
        _searchItems(_searchController.text);
      }
    } else {
      categories[index].selected = !categories[index].selected;
      setState(() {
        _isLoading = true;
      });
      (categories[index].selected)
          ? _selectedCategories.add(categories[index])
          : _selectedCategories.remove(categories[index]);
      if (_selectedCategories.isEmpty) {
        _matchingList = _allFoods.toList();
        _orderMatchesByCategories(_searchController.text);
      } else {
        _orderMatchesByCategories(_searchController.text);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  _orderMatchesByCategories(String val) {
    if (_selectedCategories.isNullOrEmpty) {
      if (val == "") {
        _matchingList = _allFoods.toList();
      }
    } else {
      List<String> _selectedCategoriesStrings = List.generate(
          _selectedCategories.length,
          (index) => _selectedCategories[index].category);
      List<FoodModel> _ref = [];

      for (var element in _matchingList) {
        for (var selectedCategory in _selectedCategoriesStrings) {
          if (element.category == selectedCategory) {
            _ref.add(element);
          }
        }
      }
      setState(() {
        _matchingList = _ref.toList();
      });
    }
  }
}
