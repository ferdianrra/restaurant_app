import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant/restaurant_detail_item.dart';
import 'package:restaurant_app/screen/detail/header_detail_content_widget.dart';
import 'package:restaurant_app/screen/detail/tab_bar/menu_card_widget.dart';
import 'package:restaurant_app/screen/detail/tab_bar/menu_widget.dart';
import 'package:restaurant_app/screen/detail/tab_bar/review_content_widget.dart';
import 'package:restaurant_app/utils/image_url_builder.dart';

import 'tab_bar/description_detail_widget.dart';

class DetailContent extends StatelessWidget {
  final RestaurantDetailItem restaurantItem;
  const DetailContent({
    super.key,
    required TabController tabController,
    required this.restaurantItem
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        HeaderDetailContentWidget(restaurantItem: restaurantItem),
        const SizedBox(height: 8),
        TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: "Menu"),
              Tab(text: "Description"),
              Tab(text: "Review"),
            ]
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              MenuWidget(menu: restaurantItem.menus),
              DescriptionWidget(restaurantItem: restaurantItem),
              ReviewContentWidget(reviews: restaurantItem.customerReviews),
            ],
          ),
        ),
      ],
    );
  }
}

