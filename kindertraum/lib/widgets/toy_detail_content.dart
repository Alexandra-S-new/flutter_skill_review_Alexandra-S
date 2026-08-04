import 'package:flutter/material.dart';
import 'package:kindertraum/models/toy.dart';
import 'package:kindertraum/widgets/detail_selection.dart';
import 'package:kindertraum/widgets/rating_stars.dart';

class ToyDetailContent extends StatelessWidget {
  final Toy toy;
  final VoidCallback? onAddToCart;

  const ToyDetailContent({
    super.key,
    required this.toy,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.toys,
                  size: 70,
                ),
              ),
              Text(
                toy.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  RatingStars(toy: toy),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    toy.rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Text(
                "${toy.price.toStringAsFixed(2)} €",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              DetailSelection(
                heading: 'Beschreibung',
                content: "${toy.description}",
              ),
              DetailSelection(heading: "Kategorie", content: toy.category),
              DetailSelection(heading: "Marke", content: toy.brand),
              DetailSelection(heading: "Alter", content: "${toy.minAge}"),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: onAddToCart,
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("In den Warenkorb"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
