import 'package:flutter/material.dart';
import 'package:kindertraum/data/demoToys.dart';
import 'package:kindertraum/screens/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kindertraum")),
      body: Column(
        children: [
          Center(
            child: Text("Willkommen im Kindertraum"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(toy: demoToys.first),
                ),
              );
            },
            child: Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
  }
}
