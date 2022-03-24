part of 'homepageview_cubit.dart';

@immutable
abstract class HomePageViewState {}

class HomepageviewInitial extends HomePageViewState {}
class HomepageviewCompleted extends HomePageViewState {
 final List<FoodModel>? a;

  HomepageviewCompleted(this.a);
}
