part of 'homepageview_cubit.dart';

@immutable
abstract class HomePageViewState {}

class HomepageviewInitial extends HomePageViewState {}
class HomepageviewCompleted extends HomePageViewState {
 final List<FoodModel>? mostLikedFoods;
 final List<FoodModel>? lastAddedFoods;
 final List<ContestModel>? FinishedContestFoods;

  HomepageviewCompleted(this.mostLikedFoods,this.lastAddedFoods,this.FinishedContestFoods);
}
