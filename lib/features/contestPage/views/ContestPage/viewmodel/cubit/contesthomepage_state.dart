part of 'contesthomepage_cubit.dart';

@immutable
abstract class ContesthomepageState {}

class ContesthomepageInitial extends ContesthomepageState {}

class ContesthomepageLoading extends ContesthomepageState {}

class ContesthomepageComplate extends ContesthomepageState {
  final List<ContestModel>? awardContestList;

  final List<ContestModel>? mostPopularList;

  ContesthomepageComplate(this.awardContestList, this.mostPopularList);
}
