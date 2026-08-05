class Toy {
  // Datenmodell für ein Spielzeug.
  // Enthält alle Informationen, die für die Produktdarstellung benötigt werden.
  //Id als String, für den Fall einer Verbindung mit einer Rest-Api
  final String id;
  final String title;
  final String? description;
  final double price;
  final String category;
  final String? imageUrl;
  final String brand;
  final int minAge;
  final double? rating;
  final int stock;

  const Toy({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.category,
    this.imageUrl,
    required this.brand,
    required this.minAge,
    this.rating,
    required this.stock,
  });
}
