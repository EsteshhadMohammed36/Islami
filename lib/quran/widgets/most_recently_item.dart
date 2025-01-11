import 'package:flutter/material.dart';

import '../../app_colors.dart';

class MostRecentlyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.7,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Sura En."), Text("Sura Ar."), Text("Ayat num.")],
          ),
          Image.asset(
            "assets/images/most_recently_image.png",
            height: screenSize.height * 0.1,
            width: screenSize.width * 0.3,
          )
        ],
      ),
    );
  }
}
