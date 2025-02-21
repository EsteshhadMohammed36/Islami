import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/onboarding/custom_text_button.dart';
import 'package:islami/onboarding/dot_indicator.dart';
import 'package:islami/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/page_view_element.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewElement> pages = [
    PageViewElement(
        image: "assets/images/onboarding_welcome.png",
        title: "Welcome To Islami App",
        desc: null),
    PageViewElement(
        image: "assets/images/onboarding_islami.png",
        title: "Welcome To Islami",
        desc: "We Are Very Excited To Have You In Our Community"),
    PageViewElement(
        image: "assets/images/onboarding_quran.png",
        title: "Reading the Quran",
        desc: "Read, and your Lord is the Most Generous"),
    PageViewElement(
        image: "assets/images/onboarding_bearish.png",
        title: "Bearish",
        desc: "Praise the name of your Lord, the Most High"),
    PageViewElement(
        image: "assets/images/onboarding_radio.png",
        title: "Holy Quran Radio",
        desc:
            "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/islami_logo.png"),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return OnBoardingPage(pageViewElement: pages[index]);
                  },
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      CustomTextButton(
                          onPressed: currentIndex != 0
                              ? () {
                                  pageController.animateToPage(currentIndex - 1,
                                      duration: Duration(microseconds: 500),
                                      curve: Curves.bounceIn);
                                }
                              : null,
                          text: currentIndex == 0 ? "" : "Back"),
                      Spacer(),
                      CustomTextButton(
                          onPressed: () {
                            if (currentIndex == 4)
                              setOnBoarding(); //store in Shared prefs
                            else {
                              pageController.animateToPage(currentIndex + 1,
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.bounceIn);
                            }
                          },
                          text: currentIndex == 4 ? "Finish" : "Next"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotIndicator(
                        isSelected: currentIndex == 0,
                      ),
                      DotIndicator(
                        isSelected: currentIndex == 1,
                      ),
                      DotIndicator(
                        isSelected: currentIndex == 2,
                      ),
                      DotIndicator(
                        isSelected: currentIndex == 3,
                      ),
                      DotIndicator(
                        isSelected: currentIndex == 4,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void setOnBoarding() async {
    //storing
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTime", false);
    //statement after storing => Navigation to home screen
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
