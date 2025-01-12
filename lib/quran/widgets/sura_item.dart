import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel suraModel;

  SuraItem({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/sura_num_frame.png",
              ),
              Text(
                "${suraModel.index + 1}",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )
            ],
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${suraModel.enSuraName}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              Text(
                "${suraModel.ayaNumber} Verses",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              )
            ],
          ),
          Spacer(),
          Text(
            "${suraModel.arSuraName}",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
