import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/screens/hadeth_tab.dart';
import 'package:islami/screens/quran_tab.dart';
import 'package:islami/screens/radio_tab.dart';
import 'package:islami/screens/sebha_tab.dart';
import 'package:islami/screens/time_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected_icon = 0;
  List<String> backgroudImages = [
    "assets/images/quran_bg.png",
    "assets/images/hadeth_bg.png",
    "assets/images/sebha_bg.png",
    "assets/images/radio_bg.png",
    "assets/images/time_bg.png"
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroudImages[selected_icon],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: tabs[selected_icon],
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selected_icon,
            onTap: (index) {
              selected_icon = index;
              setState(() {});
            },
            selectedItemColor: AppColors.white,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            items: [
              BottomNavigationBarItem(
                  icon: buildNavBarItem(0, "quran_icon"), label: ""),
              BottomNavigationBarItem(
                  icon: buildNavBarItem(1, "hadeth_icon"), label: ""),
              BottomNavigationBarItem(
                  icon: buildNavBarItem(2, "sebha_icon"), label: ""),
              BottomNavigationBarItem(
                  icon: buildNavBarItem(3, "radio_icon"), label: ""),
              BottomNavigationBarItem(
                  icon: buildNavBarItem(4, "time_icon"), label: "")
            ],
          ),
        )
      ],
    );
  }

  Widget buildNavBarItem(int index, String imageName) {
    return selected_icon == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage("assets/images/$imageName.png")),
          )
        : ImageIcon(AssetImage("assets/images/$imageName.png"));
  }
}
