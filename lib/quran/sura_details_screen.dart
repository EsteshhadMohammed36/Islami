import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  static const String routeName = "SuraDetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) loadSuraContent(args.index);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.enSuraName),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/sura_details_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  args.arSuraName,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${verses[index]}",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        itemCount: verses.length,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraContent(int index) async {
    String suraContent =
        await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    setState(() {});
  }
}
