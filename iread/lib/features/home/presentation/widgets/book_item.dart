import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.selectedEntity});
  final BookEntity selectedEntity;
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
              aspectRatio: 2.8 / 3,
              child: selectedEntity.image == null
                  ? Image.asset(AssetsPath.testBookPath, fit: BoxFit.fill)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.memory(selectedEntity.image!,
                          fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                selectedEntity.title,
                style: Styles.textStyle18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}
