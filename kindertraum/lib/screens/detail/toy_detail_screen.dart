import 'package:flutter/material.dart';
import 'package:kindertraum/models/toy.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/widgets/cart_button.dart';
import 'package:kindertraum/widgets/toy_detail_content.dart';
import 'package:provider/provider.dart';

class ToyDetailScreen extends StatelessWidget {
  const ToyDetailScreen({super.key, required this.toy});
  final Toy toy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toy.title),
        actions: [CartButton()],
      ),
      body: ToyDetailContent(
        toy: toy,
        onAddToCart: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${toy.title} hinzugefügt'),
              duration: Duration(seconds: 1),
            ),
          );
          context.read<CartProvider>().addToCart(toy);
        },
      ),
    );
  }
}
