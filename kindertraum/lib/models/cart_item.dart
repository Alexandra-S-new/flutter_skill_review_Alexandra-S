import 'package:kindertraum/models/toy.dart';

class CartItem {
  final Toy toy;
  int quantity;

  CartItem({required this.toy, this.quantity = 1});

  double get totalPrice => toy.price * quantity;
}
