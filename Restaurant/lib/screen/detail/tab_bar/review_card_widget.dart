import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant/customer_review.dart';

import '../../../style/typography/restaurant_text_styles.dart';

class ReviewCardWidget extends StatelessWidget {
  final CustomerReview review;
  const ReviewCardWidget({
    super.key,
    required this.review
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          children: [
            const Image(
              image: AssetImage("images/person.png"),
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                     review.name,
                   style: RestaurantTextStyles.title,
                 ),
                 Text(
                     review.date,
                     style: RestaurantTextStyles.body
                 ),
                   const SizedBox(height: 8),
                  Text(
                      review.review,
                      style: RestaurantTextStyles.body
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
