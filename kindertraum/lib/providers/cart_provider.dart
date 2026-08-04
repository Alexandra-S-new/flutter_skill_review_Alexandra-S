import 'package:flutter/material.dart';
import 'package:kindertraum/models/cart_item.dart';
import 'package:kindertraum/models/toy.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Toy toy) {
    //print("addToCart wurde aufgerufen");
    for (final item in _items) {
      if (item.toy.id == toy.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }

    _items.add(CartItem(toy: toy));
    print(_items.length);
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
    return;
  }

  void decreaseQuantity(CartItem item) {
    item.quantity--;
    notifyListeners();
    return;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPriceAll {
    return _items.fold(
      0,
      (sum, item) => sum + item.totalPrice,
    );
  }

  int get itemCount {
    return _items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }
}
