import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/contestDetail_strings.dart';
import 'package:vbt_food_challange/core/constant/strings/contestFinishDetail_strings.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/features/contestPage/views/ContestPage/viewmodel/cubit/contesthomepage_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../../../core/widgets/food_container.dart';
import '../../../../../product/widgets/appbar.dart';
import '../../../../core/theme/color/color_theme.dart';
import '../../model/contest_model.dart';

//kazanan kişi eklenecek
class FinishedContestPageView extends StatelessWidget {
  final ContestModel? model;
  final int? pageId;
  const FinishedContestPageView(
      {Key? key, required this.model, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    TextStyle? appbarTitleStyle =
        Theme.of(context).textTheme.headline5?.copyWith(
              color: isDark ? AppColors().white : AppColors().black,
              fontWeight: FontWeight.bold,
            );

    TextStyle? bodyTitleStyle = Theme.of(context).textTheme.headline5?.copyWith(
          color: isDark ? AppColors().white : AppColors().black,
          fontWeight: FontWeight.normal,
        );

    TextStyle kalanTimeTextStyle = const TextStyle(
        color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold);

    TextStyle? bodyTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: isDark ? AppColors().white : AppColors().black,
        );

    return BlocProvider(
      create: (context) => ContesthomepageCubit(),
      child: BlocConsumer<ContesthomepageCubit, ContesthomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          context.read<ContesthomepageCubit>().otherFoodList =
              model?.contestFoods;

          return Scaffold(
            appBar:
                header(context: context, name: model?.name ?? "", isback: true),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: model != null
                  ? Column(
                      children: [
                        _buildImageOfContest(
                            kalanTimeTextStyle, context, model),

                        _buildMiddleContent(context, appbarTitleStyle,
                            bodyTitleStyle, bodyTextStyle, pageId, model),
                        //Tamamlanan Yarışmalar
                        _participantRecipe(appbarTitleStyle, model),

                        //Son Eklenen Tarifler
                      ],
                    )
                  : const Center(child: Text("Not Found")),
            ),
            bottomNavigationBar: const BottomNavbar(pageid: 2),
          );
        },
      ),
    );
  }

  Padding _buildMiddleContent(
      BuildContext context,
      TextStyle? appbarTitleStyle,
      TextStyle? bodyTitleStyle,
      TextStyle? bodyTextStyle,
      int? pageId,
      ContestModel? model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors().green.withOpacity(1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ContestFinishedDetailPageStrings.kazanilacakRozet,
                  style: appbarTitleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.network(model?.badgeUrl.toString() ?? "")),
                ),
              ],
            ),
          ),
          if (pageId == 1)
            Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
                child: Column(
                  children: [
                    Text(model?.description ?? "",
                        textAlign: TextAlign.center, style: bodyTitleStyle),
                    CustomButton(
                        text: " Yarışmaya Katıl",
                        isLoading: false,
                        func: () =>
                            Navigator.pushNamed(context, "/addFoodPage")),
                  ],
                )),
        ],
      ),
    );
  }

  Column _participantRecipe(TextStyle? bodyTitleStyle, ContestModel? model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            ContestDetailPageStrings.participantTitle,
            style: bodyTitleStyle,
          ),
        ),

        //Future Builder ile çevrelenip yarışmaya katılanlar
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageCardWidget(
                        height: context.height * 15 / 100,
                        width: context.width * 1.2 / 3,
                        url:
                            "https://www.gunceltarif.com/wp-content/uploads/KEBAB.jpg",
                      ),
                    ),
                    Column(
                      children: [
                        const Text("Ayşe hanım"),
                      ],
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }

  Padding _buildImageOfContest(
      TextStyle kalanTimeTextStyle, BuildContext context, ContestModel? model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCardWidget(
            height: context.height / 4,
            url: model?.imageUrl.toString() ?? "",
            width: context.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pageId == 1
                    ? ContestFinishedDetailPageStrings.finishTimeText
                    : "Yarışma Bitti",
                style: kalanTimeTextStyle,
              ),
              Text(
                ContestFinishedDetailPageStrings.participantNumber +
                    " kişi katıldı",
                style: kalanTimeTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
