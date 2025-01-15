import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethItem extends StatelessWidget {
  int index;

  HadethItem({required this.index});

  HadethModel? hadeth;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    loadHadethFile();
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/hadeth_item_bg.png"),
                fit: BoxFit.fill),
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Text("title"),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Text(
                  "content",
                  textAlign: TextAlign.center,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ));
  }

  void loadHadethFile() async {
    String hadethFile =
        await rootBundle.loadString("assets/files/hadeth/h${index}.text");
    List<String> hadethLines = hadethFile.split("\n");
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = HadethModel(title: title, content: content, num: index + 1);
  }
}
