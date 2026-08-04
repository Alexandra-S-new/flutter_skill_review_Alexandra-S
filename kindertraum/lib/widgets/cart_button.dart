import 'package:flutter/material.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Badge(
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            isLabelVisible: cart.itemCount > 0,
            label: Text(
              cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 32,
              ),
            ),
          );
        },
      ),
    );
  }
}
