import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class KRatingBar extends StatelessWidget {
  const KRatingBar({
    Key? key,
    required this.rate,
    this.itemSize = 16,
  }) : super(key: key);

  final double rate;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amberAccent,
      ),
      itemCount: 5,
      itemSize: itemSize,
    );
  }
}
