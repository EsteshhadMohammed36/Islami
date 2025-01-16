import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/radio/default_tab_bar_view.dart';
import 'package:islami/radio/defualt_tab_bar.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var height = MediaQuery.sizeOf(context).height;
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/islami_logo.png",
                width: double.infinity,
              ),
              Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.blackColor),
                child: TabBar(
                    labelColor: AppColors.black,
                    labelStyle: textTheme.bodyMedium,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryColor),
                    unselectedLabelStyle: textTheme.bodyMedium,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: AppColors.white,
                    tabs: [
                      DefaultTabBar(text: "Radio"),
                      DefaultTabBar(text: "Reciters")
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [DefaultTabBarView(), DefaultTabBarView()],
                ),
              )
            ],
          ),
        ));
  }
}
