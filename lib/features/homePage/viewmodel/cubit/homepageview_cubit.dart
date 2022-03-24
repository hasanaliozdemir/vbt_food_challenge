import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../model/foodModel.dart';
import '../../service/foodList_Service.dart';

part 'homepageview_state.dart';

class HomePageViewCubit extends Cubit<HomePageViewState> {
  HomePageViewCubit() : super(HomepageviewInitial()){
     _init();
  }

  List<FoodModel>? lastFoodList;
  List<FoodModel>? mostLikedFoodList;
  String? cooker;
  bool isLoading = false;


   final String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";

         
  // List<FoodModel?> foodList = [];
  // List<ContestModel?> contestList = [];

  



  // FoodListService _trendTitleService = FoodListService();
  // ContestModelService _popularTitleService = ContestModelService();

  Future<void> _init() async {
     changeLoading();
lastFoodList = await FoodListService().getListFood();
mostLikedFoodList= await FoodListService().getMostLikedListFood();

emit(HomepageviewCompleted(lastFoodList));
changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
    print(isLoading);
  }
  Future<String> getUser(String ref)async{
   DocumentSnapshot<Map<String,dynamic>> user = await FirebaseFirestore.instance.doc(ref).get();
    print(user.data());
    String username = user.data()?['name'];
    return username;
  }

}
