part of 'foodadd_cubit.dart';

@immutable
abstract class FoodAddState {}

class FoodAddInitial extends FoodAddState {}

class FoodAddComplate extends FoodAddState {
  final File? image;

  FoodAddComplate(this.image);
}

class FoodAddError extends FoodAddState {}
