class CategoryItem{
  final String name;

  CategoryItem({
    required this.name
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
        name: json["name"]
    );
  }
}