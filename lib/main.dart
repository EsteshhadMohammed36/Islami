import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/quran/sura_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraModel.getMostRecentlyFromSharedPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
