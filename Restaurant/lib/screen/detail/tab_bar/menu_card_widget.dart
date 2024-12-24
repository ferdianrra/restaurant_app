
import 'package:flutter/material.dart';

import '../../../style/typography/restaurant_text_styles.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final bool isFoods;
  const MenuCard({
    super.key,
    required this.name,
    required this.isFoods
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Card(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: isFoods? const AssetImage("images/food.png") : const AssetImage("images/drink.png"),
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Text(
                  name,
                  style: RestaurantTextStyles.body,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
