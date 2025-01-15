import 'package:flutter/material.dart';

class DefaultTabBar extends StatelessWidget {
  String text;

  DefaultTabBar({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
