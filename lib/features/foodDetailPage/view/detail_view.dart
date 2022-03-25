import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/features/foodDetailPage/view/recipePage.dart';
import 'package:vbt_food_challange/features/foodDetailPage/viewmodel/cubit/fooddetailpage_cubit.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

import '../../../core/widgets/food_container.dart';
import '../../../product/widgets/appbar.dart';
import '../parts/comments_page.dart';

class FoodDetailPageView extends StatelessWidget {
  FoodModel? foodModel;
  // List<CommentModel> a=[];
  FoodDetailPageView({Key? key, required this.foodModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FooddetailpageCubit(),
      child: BlocConsumer<FooddetailpageCubit, FooddetailpageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: header(
                context: context,
                name: foodModel?.name ?? "null",
                isback: false),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 30 / 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: foodModel?.imageUrls?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: ImageCardWidget(
                            url: foodModel?.imageUrls?[0] ?? "",
                            width: context.width,
                            height: context.height / 4,
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                      ]),
                      const SizedBox(
                        width: 90,
                      ),
                      Text(
                        "${foodModel?.commentList?.length.toString()} yorum",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ContainedTabBarView(
                      tabs: const [
                        Text('Tarif'),
                        Text('Yorumlar'),
                      ],
                      views: [
                        Container(
                          child: RecipePage(
                            foodModel: foodModel,
                          ),
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: CommentsPage(),
                            // child:CommentsPage(commentList: foodModel!.commentList??foodDataList[0].commentList),

                            // foodModel?.commentList!=null ?CommentsPage(commentList: foodModel?.commentList??context.read<FooddetailpageCubit>().comments):Container()
                          ),
                        ),
                      ],
                      onChange: (index) => {},
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
