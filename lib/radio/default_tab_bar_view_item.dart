import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class DefaultTabBarViewItem extends StatefulWidget {
  @override
  State<DefaultTabBarViewItem> createState() => _DefaultTabBarViewItemState();
}

class _DefaultTabBarViewItemState extends State<DefaultTabBarViewItem> {
  bool isFavPressed = true;
  bool isPlayPressed = true;
  bool isVolumePressed = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var textTheme = Theme.of(context)!.textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/radio_play_sound.png",
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "data",
              style: textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    isFavPressed = !isFavPressed;
                    setState(() {});
                  },
                  icon: isFavPressed
                      ? Icon(Icons.favorite_border_outlined, size: 35)
                      : Icon(Icons.favorite, size: 35),
                  color: AppColors.black,
                ),
                IconButton(
                  onPressed: () {
                    isPlayPressed = !isPlayPressed;
                    setState(() {});
                  },
                  icon: isPlayPressed
                      ? Icon(Icons.pause, size: 45)
                      : Icon(Icons.play_arrow, size: 45),
                  color: AppColors.black,
                ),
                IconButton(
                  onPressed: () {
                    isVolumePressed = !isVolumePressed;
                    setState(() {});
                  },
                  icon: isVolumePressed
                      ? Icon(Icons.volume_up, size: 35)
                      : Icon(Icons.volume_off, size: 35),
                  color: AppColors.black,
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
