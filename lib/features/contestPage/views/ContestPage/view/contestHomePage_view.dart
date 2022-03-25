import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/contestpage_strings.dart';
import 'package:vbt_food_challange/features/contestPage/model/contest_model.dart';
import 'package:vbt_food_challange/features/contestPage/views/ContestPage/viewmodel/cubit/contesthomepage_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../../../core/widgets/category_container.dart';
import '../../../../../core/widgets/food_container.dart';
import '../../../../../product/widgets/appbar.dart';
import '../../../../../product/widgets/fab.dart';
import '../../contestFinishedDetailPage/finishedContestPage.dart';

class ContestPageView extends StatelessWidget {
  const ContestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);

    return BlocProvider(
      create: (context) => ContesthomepageCubit(),
      child: BlocConsumer<ContesthomepageCubit, ContesthomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: header(context: context, name: "YARIŞMALAR", isback: false),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const MyFAB(),
            bottomNavigationBar: const BottomNavbar(pageid: 2),
            body: context.read<ContesthomepageCubit>().isLoading
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        //En Beğeniler Tarifler
                        SizedBox(
                          height: context.height * 5 / 100,
                          width: double.infinity,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return CategoryTextContainerWidget(
                                  text: context
                                      .read<ContesthomepageCubit>()
                                      .category[index],
                                  onpressed: () {},
                                );
                              }),
                        ),

                        _buildAwardContest(
                            bodyTitleStyle,
                            context,
                            context
                                .read<ContesthomepageCubit>()
                                .awardContentList),

                        //Tamamlanan Yarışmalar
                        _buildMostPopular(
                            bodyTitleStyle,
                            context
                                .read<ContesthomepageCubit>()
                                .mostPopularContent),

                        //Son Eklenen Tarifler
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }

  Column _buildMostPopular(TextStyle bodyTitleStyle, List<ContestModel>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            ContestPageStrings.mostPopularTitle,
            style: bodyTitleStyle,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              //scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageCardWidget(
                        height: context.height * 25 / 100,
                        width: double.infinity,
                        url: list?[index].imageUrl ?? "",
                        //foodName: list?[index].name,

                        isAdded: true,
                        onpressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FinishedContestPageView(
                                      model: list?[index],
                                      pageId: 1,
                                    ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(list?[index].name.toString() ?? ""),
                          Text(
                            "${list?[index].participant?.length.toString()} kişi katılıyor",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }

  Column _buildAwardContest(TextStyle bodyTitleStyle, BuildContext context,
      List<ContestModel>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            ContestPageStrings.awardContestTitle,
            style: bodyTitleStyle,
          ),
        ),
        SizedBox(
          height: context.height * 28 / 100,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageCardWidget(
                    url: list?[index].imageUrl ?? "",
                    width: context.width * 1.5 / 2,
                    foodName: list?[index].name ?? "",
                    //participants: 20,

                    //yarışma ayrıntısına gidilecek
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FinishedContestPageView(
                                    model: list?[index],
                                    pageId: 1,
                                  )));
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
