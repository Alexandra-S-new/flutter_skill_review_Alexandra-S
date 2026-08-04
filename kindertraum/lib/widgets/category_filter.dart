import 'package:flutter/material.dart';
import 'package:kindertraum/widgets/category_chip.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: categories.map((category) {
          return CategoryChip(
            category: category,
            selected: selectedCategory == category,
            onSelected: (value) {
              onCategorySelected(category);
            },
          );
        }).toList(),
      ),
    );
  }
}
