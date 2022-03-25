import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../model/contest_model.dart';
import '../../service/finishedContestPage_service.dart';

part 'finishedcontestpage_state.dart';

class FinishedcontestpageCubit extends Cubit<FinishedcontestpageState> {
  FinishedcontestpageCubit() : super(FinishedcontestpageInitial()) {
    _init();
  }
  ContestModel? cubitModel;
  DocumentSnapshot? user;
  _init() {
    user = getWinner();
  }

  getWinner() async {
    await FinishContestPageService()
        .getWinner(cubitModel?.winner.toString() ?? "");
  }
}
