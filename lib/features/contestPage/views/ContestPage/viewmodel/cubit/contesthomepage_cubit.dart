import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vbt_food_challange/features/contestPage/model/contest_model.dart';

import '../../../../../homePage/model/foodModel.dart';
import '../../service/contestHomeService.dart';

part 'contesthomepage_state.dart';

class ContesthomepageCubit extends Cubit<ContesthomepageState> {
  ContesthomepageCubit() : super(ContesthomepageInitial()) {
    _init();
  }
  List<String> category = [
    "Tatlı",
    "Ana yemek",
    "Ara sıcak",
    "Çorba",
    "Salata"
  ];
  List<ContestModel>? awardContentList;
  List<ContestModel>? mostPopularContent;
  bool isLoading = true;
  List<FoodModel>? otherFoodList;

  Future<void> _init() async {
    changeLoading();
    awardContentList = await ContestHomeService().isAwardContestService();
    mostPopularContent = await ContestHomeService().mostPopularService();

    emit(ContesthomepageComplate(
      awardContentList,
      mostPopularContent,
    ));
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}
