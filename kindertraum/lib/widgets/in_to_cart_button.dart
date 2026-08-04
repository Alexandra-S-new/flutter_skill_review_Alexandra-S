import 'package:flutter/material.dart';

class InToCartButton extends StatelessWidget {
  const InToCartButton({
    super.key,
    required this.onAddToCart,
  });

  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onAddToCart,
      icon: const Icon(Icons.shopping_cart),
      label: const Text("In den Warenkorb"),
    );
  }
}
