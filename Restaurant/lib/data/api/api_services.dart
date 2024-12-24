import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/list_restaurant/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/list_restaurant/restaurant_search_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if(response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
  Future<RestaurantSearchResponse> getRestaurantListBySearch(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));

    if(response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
  
  Future<RestaurantDetailResponse> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(("Failed to load restaurant detail"));
    }
  }

  static String getImageUrl(String pictureId, {String size = "large"}) {
    return "$_baseUrl/$size/$pictureId";
  }

}