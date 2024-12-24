import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';

class RestaurantTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        ),
        labelColor: Colors.blueGrey,
        unselectedLabelColor: Colors.black38,
      ),
      searchBarTheme: SearchBarThemeData(
        hintStyle:WidgetStateProperty.all(
          const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      useMaterial3: false,
      brightness: Brightness.light,
      cardColor: RestaurantColors.white.color,
      scaffoldBackgroundColor: RestaurantColors.whiteBackground.color,
    );
  }
  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
        labelColor: Colors.lightBlueAccent,
        unselectedLabelColor: Colors.white70,
      ),
      searchBarTheme: SearchBarThemeData(
        hintStyle: WidgetStateProperty.all(
          const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      useMaterial3: false,
      brightness: Brightness.dark,
      cardColor: const Color(0xFF1E1E1E),
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme.dark(
        primary: Colors.lightBlueAccent,
        secondary: Colors.tealAccent,
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white,
      ),
    );
  }

}