import 'dart:ui';

enum RestaurantColors {
  white("White", Color(0xFFFFFFFF)),
  whiteBackground("White_Background", Color(0xFFf5f6f8));

  const RestaurantColors(this.name, this.color);
  final String name;
  final Color color;
}