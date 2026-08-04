import 'package:flutter/material.dart';
import 'package:kindertraum/models/toy.dart';
import 'package:kindertraum/widgets/in_to_cart_button.dart';

class ToyCard extends StatelessWidget {
  final Toy toy;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ToyCard({
    super.key,
    required this.toy,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              Text(
                "${toy.price.toStringAsFixed(2)} €",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Text("Kategorie: ${toy.category}"),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: InToCartButton(onAddToCart: onAddToCart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
