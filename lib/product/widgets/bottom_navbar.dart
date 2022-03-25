import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';

class BottomNavbar extends StatefulWidget {
  final int pageid;
  const BottomNavbar({Key? key, required this.pageid}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      padding: EdgeInsets.only(top: context.height / 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item(
            icon: 'home',
            title: 'Anasayfa',
            pageName: "homePage",
            id: 0,
          ),
          item(
            icon: 'search',
            title: 'Tarif Ara',
            pageName: "searchPage",
            id: 1,
          ),
          item(
            icon: 'chef',
            title: 'Yarışmalar',
            pageName: "contestPage",
            id: 2,
          ),
          item(
            icon: 'profile',
            title: 'Profil',
            pageName: "profilePage",
            id: 3,
          ),
        ],
      ),
    );
  }

  Widget item({
    required String title,
    required String icon,
    required String pageName,
    required int id,
  }) {
    return InkWell(
      onTap: () {
        id != 0
            ? Navigator.pushNamedAndRemoveUntil(
                context, "/$pageName", (route) => false)
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePageView(),
                ));
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/bottom_navbar/$icon.svg',
            height: 35,
            color: widget.pageid == id ? AppColors().red : AppColors().darkGrey,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
