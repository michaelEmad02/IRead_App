import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ContinueReadingBookItem extends StatefulWidget {
  const ContinueReadingBookItem({super.key});

  @override
  State<ContinueReadingBookItem> createState() =>
      _ContinueReadingBookItemState();
}

class _ContinueReadingBookItemState extends State<ContinueReadingBookItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            color: kListItemColor, borderRadius: BorderRadius.circular(15)),
        width: MediaQuery.of(context).size.width * .76,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2.8 / 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AssetsPath.testBookPath,
                        fit: BoxFit.fill,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Test Book",
                          style: Styles.textStyle18,
                          overflow: TextOverflow.ellipsis,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 13.0,
                          percent: 100 / 250, // Pass progress (0.0 to 1.0)
                          center: Text(
                            "${(100 / 250 * 100).toStringAsFixed(0)}%",
                            style: const TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.grey[300]!,
                          progressColor: kSecondColor,
                          padding: EdgeInsets.zero,
                          animation: true,
                          animationDuration: 1000,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
