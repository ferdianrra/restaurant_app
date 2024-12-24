import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant/menu.dart';

import '../../../style/typography/restaurant_text_styles.dart';
import 'menu_card_widget.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;
  const MenuWidget({
    super.key,
    required this.menu
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foods",
            style: RestaurantTextStyles.title,
          ),
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: menu.foods.length,
                itemBuilder: (context, index) {
                  final foods = menu.foods[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: MenuCard(name: foods.name, isFoods: true),
                  );
                }
            ),
          )     ,
          Text(
              "Drinks",
              style: RestaurantTextStyles.title
          ),
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: menu.drinks.length,
                itemBuilder: (context, index) {
                  final drinks = menu.drinks[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: MenuCard(name: drinks.name, isFoods: false),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
