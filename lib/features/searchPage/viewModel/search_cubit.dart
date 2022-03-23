import 'package:bloc/bloc.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit() : super(SearchPageInitial());
}

abstract class SearchPageState {}

class SearchPageInitial extends SearchPageState {}

class SearchPageLoadingState extends SearchPageState {}

class SearchPageErrorState extends SearchPageState {}
