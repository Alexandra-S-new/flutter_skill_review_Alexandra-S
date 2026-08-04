import 'package:flutter/material.dart';
import 'package:kindertraum/app/app.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const KindertraumApp(),
    ),
  );
}
