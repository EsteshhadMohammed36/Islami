import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';

import '../../app_colors.dart';

class MostRecentlyItem extends StatelessWidget {
  MostRecentlyItem({required this.sura});

  SuraModel sura;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var textTheme = Theme.of(context).textTheme;
    return Visibility(
      //visible: SuraModel.mostRecentlySuraIndexes.isNotEmpty,
      child: Container(
        width: screenSize.width * 0.7,
        // height: screenSize.height * 0.8,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.enSuraName,
                  style: textTheme.bodyLarge,
                ),
                Text(sura.arSuraName, style: textTheme.bodyLarge),
                Text(sura.ayaNumber, style: textTheme.bodySmall)
              ],
            ),
            Image.asset(
              "assets/images/most_recently_image.png",
              height: screenSize.height * 0.15,
              width: screenSize.width * 0.3,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
