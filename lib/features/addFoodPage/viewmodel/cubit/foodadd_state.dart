part of 'foodadd_cubit.dart';

@immutable
abstract class FoodAddState {}

class FoodAddInitial extends FoodAddState {}

class FoodaddLoading extends FoodAddState {}

class FoodAddComplate extends FoodAddState {}

class FoodAddError extends FoodAddState {}
