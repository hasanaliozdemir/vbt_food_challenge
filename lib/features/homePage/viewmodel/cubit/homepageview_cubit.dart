import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:vbt_food_challange/features/contestPage/model/contest_model.dart';

import '../../model/foodModel.dart';
import '../../service/foodList_Service.dart';

part 'homepageview_state.dart';

class HomePageViewCubit extends Cubit<HomePageViewState> {
  HomePageViewCubit() : super(HomepageviewInitial()) {
    _init();
  }

  List<FoodModel>? lastFoodList;
  List<FoodModel>? mostLikedFoodList;
  List<ContestModel>? finishedContest;

  bool isLoading = false;

  Future<void> _init() async {
    changeLoading();
    lastFoodList = await FoodListService().getListFood();
    mostLikedFoodList = await FoodListService().getMostLikedListFood();
    finishedContest = await FoodListService().getFinishedContest();

    emit(HomepageviewCompleted(
        lastFoodList, mostLikedFoodList, finishedContest));
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<String> getUser(String ref) async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.doc(ref).get();
    String username = user.data()?['name'];
    return username;
  }
}
