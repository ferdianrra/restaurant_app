import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_item.dart';

class RestaurantDetailResponse {
  final bool error;
  final String message;
  final RestaurantDetailItem restaurant;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailResponse(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetailItem.fromJson(json["restaurant"])
    );
  }
}