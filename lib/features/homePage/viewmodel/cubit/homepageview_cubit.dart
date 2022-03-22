import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepageview_state.dart';

class HomePageViewCubit extends Cubit<HomePageViewState> {
  HomePageViewCubit() : super(HomepageviewInitial());
  // {
  //   _init();
  // };
   final String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";

         
  // List<FoodModel?> foodList = [];
  // List<ContestModel?> contestList = [];

  

  bool isLoading = false;


  // FoodListService _trendTitleService = FoodListService();
  // ContestModelService _popularTitleService = ContestModelService();

  Future<void> _init() async {
    // await fetchHomePageViewData();

    // emit(HomePageViewCompleted(foodList, contestList));
  }

  void changeLoading() {
    isLoading = !isLoading;
    print(isLoading);
  }

  // Future<void> fetchHomePageViewData() async {
  //   changeLoading();
  //   foodList = await _foodListService.getTrendTitle();
  //   contestList = await _contestListService.getPopularTitle();
  //   changeLoading();
  // }
}
