class FoodItem {
  final String id;
  final String name;
  final int timeMinutes;
  final double rating;
  final int reviews;
  final List<String> description;
  final double price;
  final bool isVeg;
  final String? imageUrl; // Make this optional

  FoodItem({
    required this.id,
    required this.name,
    required this.timeMinutes,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.price,
    required this.isVeg,
    this.imageUrl, // Optional parameter
  });
}