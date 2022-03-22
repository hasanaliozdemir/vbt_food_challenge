import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/core/constant/language_manager.dart';
import 'package:vbt_food_challange/core/theme/app_theme.dart';
import 'package:vbt_food_challange/features/homepage/view/homepage_view.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import 'core/constant/app/app_constants.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
 
  runApp(EasyLocalization(
    path: AppConstants.LANG_ASSET_PATH,
    supportedLocales: LanguageManager.instance.supportedLocales,
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
      theme: ThemeManager.createTheme(AppThemeLight()),
    );
  }
}
