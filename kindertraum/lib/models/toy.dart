class Toy {
  //Id als String, da wir es mit einer Rest-Api verbinden wollen
  final String id;
  final String title;
  final String? description;
  final double price;
  final String category;
  final String imageUrl;
  final String brand;
  final int minAge;
  final double rating;
  final int stock;

  const Toy({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.brand,
    required this.minAge,
    required this.rating,
    required this.stock,
  });
}
