import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/features/contestPage/view/contest_view.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';
import 'package:vbt_food_challange/features/profilPage/view/profil_view.dart';
import 'package:vbt_food_challange/features/searchPage/view/search_view.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item(icon: 'home', title: 'Anasayfa', pageName: HomePageView()),
          item(icon: 'search', title: 'Tarif Ara', pageName: SearchPageView()),
          item(icon: 'chef', title: 'Yarışmalar', pageName: ContestView()),
          item(icon: 'profile', title: 'Profil', pageName: ProfilPageView()),
        ],
      ),
    );
  }

  Widget item({
    required String title,
    required String icon,
    required Widget pageName,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => pageName));
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/bottom_navbar/$icon.svg',
            height: 35,
            color: Colors.blueAccent,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
