import 'package:flutter/material.dart';
import 'package:kindertraum/app/theme.dart';
import 'package:kindertraum/providers/theme_provider.dart';
import 'package:kindertraum/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class KindertraumApp extends StatelessWidget {
  const KindertraumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kindheitstraum',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
