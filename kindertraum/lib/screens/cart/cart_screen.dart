import 'package:flutter/material.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/screens/checkout/checkout_screen.dart';
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
            onPressed: cart.items.isEmpty
                ? null
                : () async {
                    final shouldClear = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Warenkorb leeren"),
                          content: const Text(
                            "Möchtest du wirklich alle Artikel aus dem Warenkorb entfernen?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text("Abbrechen"),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text("Leeren"),
                            ),
                          ],
                        );
                      },
                    );

                    if (shouldClear == true) {
                      context.read<CartProvider>().clearCart();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Der Warenkorb wurde geleert."),
                        ),
                      );
                    }
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
                    "Gesamtsumme: ${cart.totalPriceAll.toStringAsFixed(2)} €",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CheckoutScreen()),
                        );
                      },
                      child: Text("Zur Kasse"),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
