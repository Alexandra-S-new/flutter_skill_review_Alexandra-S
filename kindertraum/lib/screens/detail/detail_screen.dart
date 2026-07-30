import 'package:flutter/material.dart';
import 'package:kindertraum/models/toy.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.toy});
  final Toy toy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(toy.title)),
      body: Card(
        child: Text('Preis: ${toy.price}€'),
      ),
    );
  }
}
