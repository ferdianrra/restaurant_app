import 'package:restaurant_app/data/model/list_restaurant/restaurant.dart';

sealed class RestaurantListState {}

class RestaurantListInitialState extends RestaurantListState {}

class RestaurantListLoadingState extends RestaurantListState{}

class RestaurantListErrorState extends RestaurantListState {
  final String error;
  RestaurantListErrorState(this.error);
}

class RestaurantListLoadedState extends RestaurantListState {
  final List<Restaurant> restaurantList;
  RestaurantListLoadedState(this.restaurantList);
}