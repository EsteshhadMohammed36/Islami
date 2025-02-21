import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({required this.isSelected, super.key});

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(2),
      width: isSelected ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Color(0xff707070),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
