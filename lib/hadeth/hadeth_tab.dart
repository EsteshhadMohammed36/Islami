import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Image.asset("assets/images/islami_logo.png"),
        Expanded(
            child: CarouselSlider.builder(
          itemCount: 50,
          itemBuilder: (context, index, realIndex) => HadethItem(
            index: index,
          ),
          options: CarouselOptions(
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              height: screenSize.height * 0.8),
        )),
      ],
    );
  }
}
