import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/models/page_view_element.dart';

class OnBoardingPage extends StatelessWidget {
  PageViewElement pageViewElement;

  OnBoardingPage({required this.pageViewElement, super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          pageViewElement.image,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            pageViewElement.title,
            style: textTheme.headlineMedium!
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          pageViewElement.desc ?? "",
          style: textTheme.headlineSmall!.copyWith(
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
