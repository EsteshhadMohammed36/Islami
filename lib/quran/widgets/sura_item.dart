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
              Text("${suraModel.index + 1}",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${suraModel.enSuraName}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white)),
              Text(
                "${suraModel.ayaNumber} Verses",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
          Spacer(),
          Text("${suraModel.arSuraName}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.white)),
        ],
      ),
    );
  }
}
