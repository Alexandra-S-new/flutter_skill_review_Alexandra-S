import 'package:flutter/material.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/widgets/cart_item_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Warenkorb"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartProvider>().clearCart();
            },
            icon: Icon(
              Icons.delete_forever,
              size: 32,
            ),
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text("Dein Warenkorb ist leer."),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return CartItemCard(
                        item: item,
                        increaseQuantity: () {
                          context.read<CartProvider>().increaseQuantity(item);
                        },
                        decreaseQuantity: () {
                          context.read<CartProvider>().decreaseQuantity(item);
                        },
                        removeItem: () {
                          context.read<CartProvider>().removeItem(item);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Gesamtsumme:",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
    );
  }
}
