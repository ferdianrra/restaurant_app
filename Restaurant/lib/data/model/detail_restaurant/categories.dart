import 'package:restaurant_app/data/model/detail_restaurant/category_item.dart';

class Categories {
  final List<CategoryItem> categories;

  Categories({
    required this.categories
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        categories: json["categories"] != null
    ? List<CategoryItem>.from(json["name"]!.map((x) => CategoryItem.fromJson(x))):<CategoryItem>[]
    );
  }
}