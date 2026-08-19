import 'package:flutter/material.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

enum Delivery { dhl, hermes, dpd }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Delivery? selectedDelivery = Delivery.dhl;
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Bestellübersicht")),
      body: Column(
        children: [
          RadioGroup<Delivery>(
            groupValue: selectedDelivery,
            onChanged: (Delivery? value) {
              setState(() {
                selectedDelivery = value;
              });
            },
            child: Column(
              children: <Widget>[
                RadioListTile<Delivery>(
                  title: Text("DHL"),
                  value: Delivery.dhl,
                ),
                RadioListTile<Delivery>(
                  title: Text("Hermes"),
                  value: Delivery.hermes,
                ),
                RadioListTile<Delivery>(
                  title: Text("DPD"),
                  value: Delivery.dpd,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.toy.title),
                              Text("Menge: ${item.quantity}"),
                            ],
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${item.totalPrice.toStringAsFixed(2)} €",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Text("Gesamtpreis: ${cart.totalPriceAll.toStringAsFixed(2)}"),
          FilledButton(
            onPressed: () async {
              final shouldClear = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Bestellung abschließen"),
                    content: const Text(
                      "Möchtest du wirklich die Bestellung abschließen?",
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
                        child: const Text("Bestellen"),
                      ),
                    ],
                  );
                },
              );

              if (shouldClear == true) {
                cart.clearCart();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Die Bestellung wurde erfolgreich abgeschlossen",
                    ),
                  ),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              }
            },
            child: Text("Bestellung abschließen"),
          ),
        ],
      ),
    );
  }
}
