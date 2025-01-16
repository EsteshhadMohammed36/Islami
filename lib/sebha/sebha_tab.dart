import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا اله الا الله",
  ];
  int counter = 0;
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/islami_logo.png",
          //width: double.infinity,
        ),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          textAlign: TextAlign.center,
          style: textTheme.headlineLarge,
        ),
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/sebha_header.png"),
                    Transform.rotate(
                        angle: angle,
                        child: Image.asset("assets/images/sebha_body.png")),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: height * 0.1),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${tasbeeh[index]}\n${counter}",
                    style: textTheme.headlineLarge,
                  ))
            ],
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            index = 0;
            counter = 0;
            setState(() {});
          },
          child: Text("Reset", style: textTheme.headlineMedium),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        )
      ],
    );
  }

  void onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbeeh.length) index = 0;
    angle += 360 / 33;
    setState(() {});
  }
}
