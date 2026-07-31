import 'package:flutter/material.dart';
import 'package:kindertraum/data/demoToys.dart';
import 'package:kindertraum/widgets/toy_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //final List<Toy> items;

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

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: demoToys.length,
                itemBuilder: (context, index) {
                  final toy = demoToys[index];
                  return ToyCard(
                    toy: toy,
                    onTap: () {},
                    onAddToCart: () {},
                  );
                },
              ),
            ),
          ),
        ],
        /* ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final toy = items[index];
              return ListTile();
            
            
             trailing: ElevatedButton(
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
            },
          ),*/
      ),
    );
  }
}
