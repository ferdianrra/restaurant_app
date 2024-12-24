import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/model/detail_restaurant/customer_review.dart';
import 'package:restaurant_app/screen/detail/tab_bar/review_card_widget.dart';

class ReviewContentWidget extends StatelessWidget {
  final List<CustomerReview> reviews;
  const ReviewContentWidget({
    super.key,
    required this.reviews
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ReviewCardWidget(review: review),
            );
          }
      ),
    );
  }
}
