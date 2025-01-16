import 'package:flutter/material.dart';
import 'package:islami/radio/default_tab_bar_view_item.dart';

class DefaultTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => DefaultTabBarViewItem(),
      itemCount: 10,
    );
  }
}
