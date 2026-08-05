import 'package:flutter/material.dart';
import 'package:kindertraum/app/app.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/providers/theme_provider.dart';
import 'package:provider/provider.dart';

/*
  Kindertraum Shop App

  Architektur:
  - Provider verwaltet den Warenkorb
  - Models enthalten Datenstrukturen
  - Screens stellen Seiten dar
  - Widgets sind wiederverwendbare UI-Komponenten

  Features:
  - Produktübersicht
  - Suche und Filter
  - Warenkorb
  - Dark/Light Theme
  - Checkout Simulation
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: themeProvider,
        ),
      ],
      child: const KindertraumApp(),
    ),
  );
}
