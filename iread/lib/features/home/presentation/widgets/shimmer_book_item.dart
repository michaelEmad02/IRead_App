import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookItem extends StatelessWidget {
  const ShimmerBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Darker gray for base
      highlightColor: Colors.grey[100]!, // Slightly lighter gray for highlight
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3.3 / 4,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 18,
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width * 0.4,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
