import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_item.dart';

sealed class RestaurantDetailResultState{}

class RestaurantDetailInitialState extends RestaurantDetailResultState {}
class RestaurantDetailLoadingState extends RestaurantDetailResultState {}
class RestaurantDetailErrorState extends RestaurantDetailResultState {
  final String error;
  RestaurantDetailErrorState(this.error);
}
class RestaurantDetailLoadedState extends RestaurantDetailResultState {
  final RestaurantDetailItem data;
  RestaurantDetailLoadedState(this.data);
}