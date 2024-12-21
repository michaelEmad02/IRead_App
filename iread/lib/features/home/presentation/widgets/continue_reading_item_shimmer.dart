import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContinueReadingBookItemShimmer extends StatelessWidget {
  const ContinueReadingBookItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width * .75,
        child: Row(
          children: [
            // Shimmer effect for the book cover
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer effect for the book title
                    Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    // Shimmer effect for the author name
                    Container(
                      height: 16,
                      width: 150,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.only(top: 8),
                    ),
                    // Shimmer effect for the progress bar
                    Container(
                      height: 13,
                      width: double.infinity,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.only(top: 8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
