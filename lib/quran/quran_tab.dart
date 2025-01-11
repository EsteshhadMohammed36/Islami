import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:islami/quran/widgets/most_recently_item.dart';
import 'package:islami/quran/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 25, child: Image.asset("assets/images/islami_logo.png")),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: TextStyle(color: AppColors.primaryColor),
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                fillColor: AppColors.blackColor,
                filled: true,
                prefixIcon: Image.asset("assets/images/Vector.png"),
                hintText: "Sura Name",
                hintStyle: TextStyle(color: AppColors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
              ),
              onChanged: (value) {
                suraSearch(value);
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Most Recently ",
            style: TextStyle(
                color: AppColors.whhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MostRecentlyItem();
            },
            itemCount: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Suras List",
            style: TextStyle(
                color: AppColors.whhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 40,
          child: suraSearchIndexes.isEmpty
              ? Center(
                  child: Text(
                    "No Sura Found",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, SuraDetailsScreen.routeName,
                              arguments: SuraModel.getSuraModel(index));
                        },
                        child: suraSearchIndexes.contains(index)
                            ? SuraItem(
                                suraModel: SuraModel.getSuraModel(index),
                              )
                            : SizedBox());
                  },
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return suraSearchIndexes.contains(index)
                        ? Divider(
                            indent: 64,
                            endIndent: 64,
                            thickness: 1,
                            color: AppColors.white,
                          )
                        : SizedBox();
                  },
                  itemCount: SuraModel.ayatNumber.length,
                ),
        )
      ],
    );
  }

  List<int> suraSearchIndexes = List.generate(114, (index) => index);

  void suraSearch(String value) {
    suraSearchIndexes.clear();
    for (int i = 0; i < 114; i++) {
      if (SuraModel.arabicQuranSurahs[i].toLowerCase().contains(value) ||
          SuraModel.englishQuranSurahs[i].toLowerCase().contains(value))
        suraSearchIndexes.add(i);
      setState(() {});
    }
  }
}
