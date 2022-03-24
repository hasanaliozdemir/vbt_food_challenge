import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../contestPage/model/contest_model.dart';

part 'fooddetailpage_state.dart';

class FooddetailpageCubit extends Cubit<FooddetailpageState> {
  FooddetailpageCubit() : super(FooddetailpageInitial());
List<bool> expandedList=[
  false,false
];
List<CommentModel> comments=[];


 openClose(bool expanded,int index){
   expandedList[index]=!expanded;
   emit(FooddetailpageInitial());
 }
}
