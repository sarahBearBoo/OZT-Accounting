import 'dart:io';
import 'package:accounting/pages/dashboard.dart';
import 'package:accounting/pages/featureUnavailablePage/featureUnavailable.dart';
import 'package:accounting/pages/login.dart';
import 'package:accounting/pages/modulesPage/expensesPage/expenses.dart';
import 'package:accounting/pages/modulesPage/modulesPage/modules.dart';
import 'package:accounting/pages/morePage/more.dart';
import 'package:accounting/pages/onboarding.dart';
import 'package:accounting/pages/testing.dart';
import 'package:accounting/translations/codegen_loader.g.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This variable is to help indicate whether
/// User has visited the app before
/// For the purposes of showing Onboarding Screen only once
bool visited;
int initScreen;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  /*
  initScreen = await prefs.getInt("initScreen");

  await prefs.setInt("initScreen", 1);
  debugPrint('initScreen ${initScreen}');

   */
  visited = await prefs.getBool("visited");
  debugPrint('Have visited: $visited');
  await prefs.setBool("visited", true);




  runApp(
    EasyLocalization(

      // Locales supported by the app
      supportedLocales: [
        Locale('en', 'GB'),
        Locale('ms', 'MY')
      ],

      path: 'assets/translations',
      fallbackLocale: Locale('en', 'GB'),
      assetLoader: CodegenLoader(),
      child: AccountingApp(),
    ),
  );
}

class AccountingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "App Onboarding",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
        backgroundColor: AppColors().lightGrey,
      ),

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //home: visited == 0 || visited == null ? Home() : Login(),
      initialRoute: visited == 0 || visited == null ? '/' : '/login',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/expenses': (context) => Expenses(),
        '/dashboard' : (context) => Dashboard(),
        '/modules' : (context) => Modules(),
        '/inbox' : (context) => FeatureUnavailable(name: "Inbox", navIndex: 2,),
        '/more': (context) => More(),
      },
    );
  }
}


