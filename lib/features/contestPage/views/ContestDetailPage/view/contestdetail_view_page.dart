import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/contestDetail_strings.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../../../core/widgets/food_container.dart';
import '../../../../../product/widgets/appbar.dart';

class ContestDetailPageView extends StatelessWidget {
  const ContestDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle appbarTitleStyle = const TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle bodyTitleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle kalanTimeTextStyle = const TextStyle(
        color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold);
    String _url =
        "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg";
    return Scaffold(
      appBar: header(context: context, name: "İskender", isback: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildImageOfContest(kalanTimeTextStyle, context, _url),

            _buildMiddleContent(appbarTitleStyle, bodyTitleStyle),
            //Tamamlanan Yarışmalar
            _participantRecipe(bodyTitleStyle, _url),

            //Son Eklenen Tarifler
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(pageid: 2),
    );
  }

  Padding _buildMiddleContent(
      TextStyle appbarTitleStyle, TextStyle bodyTitleStyle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            ContestDetailPageStrings.kazanilacakRozet,
            style: appbarTitleStyle,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Icon(
              Icons.badge,
              size: 50,
              color: Colors.pink,
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                ContestDetailPageStrings.descriptionTitle,
                style: bodyTitleStyle,
              )),
          const Text(
            ContestDetailPageStrings.description,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Column _participantRecipe(TextStyle bodyTitleStyle, String _url) {
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
                        url: _url,
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
      TextStyle kalanTimeTextStyle, BuildContext context, String _url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCardWidget(
            height: context.height / 4,
            url: _url,
            width: context.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ContestDetailPageStrings.remainingTime,
                style: kalanTimeTextStyle,
              ),
              Text(
                ContestDetailPageStrings.participantNumber + " kişi katıldı",
                style: kalanTimeTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
