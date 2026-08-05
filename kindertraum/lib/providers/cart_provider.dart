import 'package:flutter/material.dart';
import 'package:kindertraum/models/cart_item.dart';
import 'package:kindertraum/models/toy.dart';

// Verwaltet den Zustand des Warenkorbs.
// ChangeNotifier informiert alle abhängigen Widgets,
// wenn sich der Warenkorb verändert.
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;
  // Fügt ein Produkt hinzu.
  // Existiert das Produkt bereits im Warenkorb,
  // wird nur die Anzahl erhöht.
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

  // Erhöht die Menge eines vorhandenen Warenkorb-Artikels.
  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  // Verringert die Menge eines Artikels.
  // Bei Menge 1 wird der Artikel entfernt.
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  // Entfernt alle Artikel aus dem Warenkorb.
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  //Entfernt nur den einen Artikel aus dem Warenkorb
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Berechnet den Gesamtpreis aller Warenkorb-Artikel.
  double get totalPriceAll {
    return _items.fold(
      0,
      (sum, item) => sum + item.totalPrice,
    );
  }

  // Liefert die Gesamtanzahl aller Produkte,
  // inklusive mehrfacher Mengen.
  int get itemCount {
    return _items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }
}
