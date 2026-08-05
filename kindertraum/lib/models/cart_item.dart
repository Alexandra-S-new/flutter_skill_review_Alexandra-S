import 'package:kindertraum/models/toy.dart';

// Repräsentiert einen Artikel im Warenkorb.
// Ein CartItem verbindet ein Produkt mit der gewünschten Menge.
class CartItem {
  final Toy toy;
  int quantity;

  CartItem({required this.toy, this.quantity = 1});

  double get totalPrice => toy.price * quantity;
}
