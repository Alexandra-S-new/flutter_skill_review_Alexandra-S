import 'package:flutter/material.dart';
import 'package:kindertraum/data/demoToys.dart';
import 'package:kindertraum/models/toy.dart';
import 'package:kindertraum/providers/cart_provider.dart';
import 'package:kindertraum/providers/theme_provider.dart';
import 'package:kindertraum/screens/detail/toy_detail_screen.dart';
import 'package:kindertraum/widgets/cart_button.dart';
import 'package:kindertraum/widgets/category_filter.dart';
import 'package:kindertraum/widgets/search_bar.dart';
import 'package:kindertraum/widgets/toy_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //final List<Toy> items;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Toy> filteredToys;
  String selectedCategory = "Alle";
  String currentSearch = "";
  @override
  void initState() {
    super.initState();

    filteredToys = List.from(demoToys);
  }

  void filterToys() {
    final searchTerm = currentSearch.toLowerCase();
    setState(() {
      filteredToys = demoToys.where((toy) {
        final matchSearch =
            currentSearch.isEmpty ||
            toy.title.toLowerCase().contains(searchTerm) ||
            toy.category.toLowerCase().contains(searchTerm);

        final matchCategory =
            selectedCategory == "Alle" || toy.category == selectedCategory;

        return matchSearch && matchCategory;
      }).toList();
    });
  }

  List<String> get categories {
    return ["Alle", ...demoToys.map((toy) => toy.category).toSet()];
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Kindertraum",
              // style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            Text(
              "Spielzeug ist für alle da",
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          CartButton(),
        ],
      ),
      body: Column(
        children: [
          ToySearchBar(
            onChanged: (value) {
              currentSearch = value;
              filterToys();
            },
          ),
          Text("Kategorien:"),
          CategoryFilter(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
              filterToys();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                filteredToys.length == 1
                    ? "1 Spielzeug gefunden"
                    : "${filteredToys.length} Spielzeuge gefunden",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),

              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredToys.length,
                itemBuilder: (context, index) {
                  final toy = filteredToys[index];
                  return ToyCard(
                    toy: toy,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ToyDetailScreen(toy: toy),
                        ),
                      );
                    },
                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(toy);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
