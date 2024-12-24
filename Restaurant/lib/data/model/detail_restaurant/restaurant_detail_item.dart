import 'dart:ffi';

import 'package:restaurant_app/data/model/detail_restaurant/categories.dart';
import 'package:restaurant_app/data/model/detail_restaurant/customer_review.dart';

import 'menu.dart';

class RestaurantDetailItem {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Categories> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetailItem({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetailItem.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: json["categories"] != null
        ? List<Categories>.from(json["categories"]!.map((x) => Categories.fromJson(x))): <Categories>[],
        menus: Menu.fromJson(json["menus"]),
        rating: (json["rating"]).toDouble(),
        customerReviews: json["customerReviews"] != null
        ? List<CustomerReview>.from(json["customerReviews"]!.map((x) => CustomerReview.fromJson(x))): <CustomerReview>[]
    );
  }
}