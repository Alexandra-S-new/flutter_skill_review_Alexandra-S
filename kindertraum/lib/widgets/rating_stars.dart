import 'package:flutter/material.dart';
import 'package:kindertraum/models/toy.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.toy,
  });

  final Toy toy;

  @override
  Widget build(BuildContext context) {
    final rating = toy.rating ?? 0.0;
    final filledStars = rating.floor();
    final emptyStars = 5 - filledStars;

    return Text(
      "★" * filledStars + "☆" * emptyStars,
      style: const TextStyle(fontSize: 22),
    );
  }
}
