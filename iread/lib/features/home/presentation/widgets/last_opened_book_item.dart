import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';

class LastOpenedBookItem extends StatelessWidget {
  const LastOpenedBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // GoRouter.of(context)
        //    .push(AppRouter.kBookDetails, extra: selectedEntity);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            color: kListItemColor, borderRadius: BorderRadius.circular(15)),
        //width: MediaQuery.of(context).size.width * .4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                      Image.asset(AssetsPath.testBookPath, fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "Test Book",
                style: Styles.textStyle18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
