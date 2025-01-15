import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetails";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var textTheme = Theme.of(context)!.textTheme;
    var hadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          "Hadeth ${hadeth.num}",
        ),
      ),
      body: Stack(children: [
        Image.asset(
          "assets/images/sura_details_bg.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Text(
                textAlign: TextAlign.center,
                hadeth.title,
                style: textTheme.headlineMedium!
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(height * 0.05),
                  itemBuilder: (context, index) {
                    return Text(
                      textAlign: TextAlign.center,
                      hadeth.content[index],
                      style: textTheme.headlineSmall!
                          .copyWith(color: AppColors.primaryColor),
                    );
                  },
                  itemCount: hadeth.content.length),
            )
          ],
        )
      ]),
    ));
  }
}
