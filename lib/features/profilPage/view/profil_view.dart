import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/core/widgets/food_container.dart';
import 'package:vbt_food_challange/features/profilPage/service/profile_service.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

class ProfilPageView extends StatefulWidget {
  const ProfilPageView({Key? key}) : super(key: key);

  @override
  State<ProfilPageView> createState() => _ProfilPageViewState();
}

class _ProfilPageViewState extends State<ProfilPageView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingMedium.copyWith(bottom: 0),
        child: Column(
          children: [
            const Spacer(
              flex: 15,
            ),
            Expanded(flex: 150, child: _buildProfileCard()),
            const Spacer(
              flex: 34,
            ),
            Expanded(
              flex: 234,
              child: _buildAchivementCard(context),
            ),
            const Spacer(
              flex: 21,
            ),
            Expanded(
              flex: 150,
              child: _buildSavedReceips(context),
            ),
            Expanded(
              flex: 150,
              child: _buildYourReceips(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(pageid: 3),
    );
  }

  Column _buildYourReceips(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tariflerin",
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors().red),
            ),
            const Spacer(),
            SizedBox(
              height: context.dynamicHeight(0.01),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  color: AppColors().red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.paddingLow.top,
        ),
        _buildReceipRow(context)
      ],
    );
  }

  Column _buildSavedReceips(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Kaydettiğin Tarifler",
              style:
                  context.textTheme.bodyLarge?.copyWith(color: AppColors().red),
            ),
            const Spacer(),
            SizedBox(
              height: context.dynamicHeight(0.01),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  color: AppColors().red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.paddingLow.top,
        ),
        _buildReceipRow(context)
      ],
    );
  }

  SingleChildScrollView _buildReceipRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(8, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.paddingLow.right),
            child: SizedBox(
              width: context.dynamicWidth(0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "data",
                      style: TextStyle(fontSize: context.dynamicWidth(0.03)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: AppColors().demonicyellow,
                        size: context.dynamicWidth(0.03),
                      );
                    }),
                  ),
                  ImageCardWidget(
                    height: context.dynamicHeight(0.08),
                    width: context.dynamicWidth(0.3),
                    url:
                        "https://cdn.ye-mek.net/App_UI/Img/out/420/2016/06/karniyarik-resimli-yemek-tarifi(20).jpg",
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Container _buildAchivementCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: AppColors().redremains),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(8, (index) {
            return _buildAchivement(context);
          }),
        ),
      ),
    );
  }

  Padding _buildAchivement(BuildContext context) {
    return Padding(
      padding: context.paddingLow.copyWith(top: context.paddingLow.top * 1.5),
      child: Container(
        width: context.dynamicWidth(0.15),
        height: context.dynamicHeight(0.1),
        decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            color: AppColors().lead.withOpacity(0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.aydemirlergergitavan.com/wp-content/uploads/2019/05/yuvarlak-8.jpg"),
              ),
            ),
            SizedBox(
              height: context.paddingLow.top,
            ),
            Icon(
              Icons.star,
              color: AppColors().demonicyellow,
            )
          ],
        ),
      ),
    );
  }

  Row _buildProfileCard() {
    return Row(
      children: [
        const Expanded(
            child: FittedBox(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.aydemirlergergitavan.com/wp-content/uploads/2019/05/yuvarlak-8.jpg"),
          ),
        )),
        Expanded(
            child: Column(
          children: [
            Expanded(child: FittedBox(child: Text("Hasan"))),
            Spacer(),
            Expanded(child: FittedBox(child: Text("Level 2"))),
            Expanded(child: FittedBox(child: Text("Patlıcan Adam"))),
          ],
        ))
      ],
    );
  }
}
