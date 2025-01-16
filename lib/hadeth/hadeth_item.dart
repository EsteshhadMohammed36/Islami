import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';

import '../models/hadeth_model.dart';
import 'hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) loadHadethFile();
    var height = MediaQuery.sizeOf(context).height;
    var textTheme = Theme.of(context)!.textTheme;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth),
      child: Container(
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
                child: Text(
                  hadeth == null ? "" : hadeth!.title,
                  style: textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: hadeth == null
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.blackColor,
                      ))
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            style: textTheme.bodyMedium!
                                .copyWith(color: AppColors.black),
                            hadeth!.content[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        itemCount: hadeth!.content.length,
                      ),
              ),
            ],
          )),
    );
  }

  void loadHadethFile() async {
    String hadethFile = await rootBundle
        .loadString("assets/files/hadeth/h${widget.index + 1}.txt");
    List<String> hadethLines = hadethFile.split("\n");
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = HadethModel(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
