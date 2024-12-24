import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_item.dart';
import 'package:restaurant_app/style/typography/restaurant_text_styles.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.restaurantItem,
  });

  final RestaurantDetailItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        restaurantItem.description,
        style: RestaurantTextStyles.body,
      ),
    );
  }
}
