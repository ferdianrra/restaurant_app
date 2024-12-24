import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('images/header_home.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken
              )
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)
          )
      ),
      width: double.infinity,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    hintText: "Search for restaurants",
                    onSubmitted: (value){
                      context.read<RestaurantListProvider>().fetchRestaurantSearch(value);
                    },
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Culinary Explorer",
                  style: TextStyle (
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23
                  ),
                ),
              ),
              const Text(
                "Discover the best restaurants around you and indulge in delicious flavors.",
                style: TextStyle(
                    color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}