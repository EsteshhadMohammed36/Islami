import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/onboarding/onboarding_screen.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraModel.getMostRecentlyFromSharedPrefs();
  bool first = await checkIsFirstTime();
  runApp(MyApp(
    firstTime: first,
  ));
}

Future<bool> checkIsFirstTime() async {
  final prefs = await SharedPreferences.getInstance();
  bool isFirst = prefs.getBool("isFirstTime") ?? true;
  return isFirst;
}

class MyApp extends StatelessWidget {
  bool firstTime;

  MyApp({required this.firstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen()
      },
      initialRoute:
          firstTime ? OnBoardingScreen.routeName : HomeScreen.routeName,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
