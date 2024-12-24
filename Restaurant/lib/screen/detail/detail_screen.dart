import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

import 'detail_content_widget.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with  TickerProviderStateMixin{

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(widget.restaurantId);
    });
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantDetailInitialState() => const Center(
              child: CircularProgressIndicator(),
            ),
            RestaurantDetailLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            RestaurantDetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            RestaurantDetailLoadedState(data: var restaurantItem) => DetailContent(
              tabController: _tabController,
              restaurantItem: restaurantItem
            ),
          };
        },
      ),
    );
  }
}

