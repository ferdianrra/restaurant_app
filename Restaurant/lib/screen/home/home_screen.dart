import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';
import 'package:restaurant_app/style/typography/restaurant_text_styles.dart';
import 'header_home_widget.dart';
import 'restaurant_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const HeaderHome(),
          DraggableScrollableSheet(
            initialChildSize: 0.73,
            minChildSize: 0.73,
            maxChildSize: 0.93,
            builder: (context, scrollController){
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
                child: Consumer<RestaurantListProvider>(
                  builder: (context, value, child){
                    return switch(value.resultState) {
                      RestaurantListInitialState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      RestaurantListLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      RestaurantListErrorState(error: var message) => Center(
                        child: Text(message),
                      ),
                      RestaurantListLoadedState(restaurantList: var restaurantList) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: restaurantList.isEmpty ? const Center(
                          child: Text('No restaurants found', style: TextStyle(fontSize: 18)),
                        ) : Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             Text(
                              "Find Your Restaurant",
                              style: RestaurantTextStyles.title,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Explore Delicious Destinations for Every Craving",
                              style: RestaurantTextStyles.body,
                            ),
                            const SizedBox(height: 16),
                            Flexible(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                controller: scrollController,
                                itemCount: restaurantList.length,
                                itemBuilder: (context, index) {
                                  final restaurant =restaurantList[index];
                                  return RestaurantCard(
                                      restaurant: restaurant,
                                    onTap: () {
                                        Navigator.pushNamed(
                                            context,
                                            NavigationRoute.detailRoute.name,
                                            arguments: restaurant.id
                                        );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    };
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}




