import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vbt_food_challange/core/constant/language_manager.dart';
import 'package:vbt_food_challange/core/constant/strings/homepage_strings.dart';
import 'package:vbt_food_challange/core/theme/app_theme.dart';
import 'package:vbt_food_challange/features/contestPage/model/contest_model.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';
import 'package:vbt_food_challange/features/profilPage/view/profil_view.dart';
import 'package:vbt_food_challange/features/registerPage/view/register_view.dart';
import 'package:vbt_food_challange/features/searchPage/view/search_view.dart';

import 'core/constant/app/app_constants.dart';

import 'features/addFoodPage/view/addFoodPage_view.dart';
import 'features/contestPage/views/ContestDetailPage/view/contestdetail_view_page.dart';
import 'features/contestPage/views/ContestPage/view/contestHomePage_view.dart';
import 'features/contestPage/views/contestFinishedDetailPage/finishedContestPage.dart';
import 'features/foodDetailPage/view/detail_view.dart';
import 'features/homePage/model/foodModel.dart';
import 'features/loginPage/view/login_view.dart';
import 'features/profilPage/service/profile_service.dart';
import 'product/staticListData/foodmodelData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: AppConstants.LANG_ASSET_PATH,
      supportedLocales: LanguageManager.instance.supportedLocales,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileService().getUser();
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.createTheme(AppThemeLight()),
        initialRoute: '/',
        routes: {

          "/": (context) => ContestPageView(),
        

        },
        onGenerateRoute: (settings) {
          //Navigator.pushNamedAndRemoveUntil(context, "/loginPage/", (route) => false);
          // Bu şekilde onGenerateRoute kısmına yolluyorum. Ardından split fonksiyonu ile ayırıyorum.
          //filtered[1] =filteredPAGE filtered[2] = _id değerim oluyor.
          List<String> filtered = settings.name!.split("/");
          switch (filtered[1]) {
            //switch içinden filtered[1] değrimi eşleştiriyorum.Çünkü aynı sayfayı bir çok farklı data için kullanıyorum.
            
            
              case "/homePome":
              return PageTransition(
                //ben filteredPage içinde bir fonksiyona eleman taşıyorum Sen sadece filtered[2] kullanarak yapabilirsin.
                child: HomePageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "searchPage":
              return PageTransition(
                //ben filteredPage içinde bir fonksiyona eleman taşıyorum Sen sadece filtered[2] kullanarak yapabilirsin.
                child: SearchPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "contestPage":
              return PageTransition(
                child: ContestPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "contestDetail":
              return PageTransition(
                child: ContestDetailPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );

            case "finishContestDetail":
              return PageTransition(
                child: FinishedContestPageView(
                  model: ContestModel(),
                ),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );

            case "registerPage":
              return PageTransition(
                child: RegisterView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );

            case "profilePage":
              return PageTransition(
                child: ProfilPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
          }
        });
  }
}