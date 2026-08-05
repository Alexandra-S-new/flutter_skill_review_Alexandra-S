import 'package:flutter/material.dart';
import 'package:kindertraum/models/cart_item.dart';

// Widget zur Darstellung eines einzelnen Warenkorb-Artikels.
// Enthält Mengensteuerung und Entfernen-Funktion.
class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    this.increaseQuantity,
    this.decreaseQuantity,
    this.removeItem,
  });

  final CartItem item;
  final VoidCallback? increaseQuantity;
  final VoidCallback? decreaseQuantity;
  final VoidCallback? removeItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,

            children: [
              Icon(
                Icons.toys,
                size: 70,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.toy.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Text(
                      "${item.toy.price.toStringAsFixed(2)} €",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        Text("Menge:"),
                        IconButton(
                          onPressed: increaseQuantity,
                          icon: Icon(Icons.add_circle_outline),
                        ),
                        Text(
                          "  ${item.quantity}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        IconButton(
                          onPressed: decreaseQuantity,
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                      ],
                    ),
                    Text(
                      "Gesamtpreis: ${item.totalPrice.toStringAsFixed(2)} €",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: removeItem,
                icon: Icon(Icons.delete_outline_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
