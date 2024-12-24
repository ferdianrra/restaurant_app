// import 'package:flutter/cupertino.dart';
// import 'package:restaurant_app/data/api/api_services.dart';
// import 'package:restaurant_app/static/restaurant_list_result_state.dart';
//
// class RestaurantSearchResultProvider extends ChangeNotifier {
//   final ApiServices _apiServices;
//
//   RestaurantSearchResultProvider(this._apiServices);
//   RestaurantListState _resultState = RestaurantListInitialState();
//   RestaurantListState get resultState => _resultState;
//
//   Future<void> fetchRestaurantSearch(String query) async {
//     try {
//       _resultState = RestaurantListLoadingState();
//       notifyListeners();
//
//       final result = await _apiServices.getRestaurantListBySearch(query);
//       if(result.error) {
//         _resultState = RestaurantListErrorState(result.);
//         notifyListeners();
//       } else {
//         _resultState = RestaurantListLoadedState(result.restaurants);
//         notifyListeners();
//       }
//     } on Exception catch (e) {
//       _resultState = RestaurantListErrorState(e.toString());
//     }
//   }
//
//
// }