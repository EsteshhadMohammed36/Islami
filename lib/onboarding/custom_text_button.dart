import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomTextButton extends StatelessWidget {
  void Function()? onPressed;
  String? text;

  CustomTextButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextButton(
      onPressed: onPressed,
      child: Text(text ?? "",
          style: textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor)),
    );
  }
}
