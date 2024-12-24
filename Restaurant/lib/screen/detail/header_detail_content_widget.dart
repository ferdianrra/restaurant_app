import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_item.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';
import 'package:restaurant_app/style/typography/restaurant_text_styles.dart';

import '../../utils/image_url_builder.dart';

class HeaderDetailContentWidget extends StatelessWidget {
  const HeaderDetailContentWidget({
    super.key,
    required this.restaurantItem,
  });

  final RestaurantDetailItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.network(
                ImageUrlBuilder.build(restaurantItem.pictureId),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 350,
              ),
            ),
            Positioned(
                left: 16,
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle
                      ),
                        padding: const EdgeInsets.all(8),
                      child: Icon(Icons.arrow_back, color: RestaurantColors.white.color),
                    ),
                  ),
                )
            )
          ]
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurantItem.name,
                    style: RestaurantTextStyles.title,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        restaurantItem.rating.toString(),
                        style: RestaurantTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "${restaurantItem.city}, ${restaurantItem.address}",
                style: RestaurantTextStyles.body,
              ),
            ],
          ),
        ),
      ],
    );
  }
}