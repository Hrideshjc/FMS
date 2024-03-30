import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant/color_directory.dart';

class ThemeModel extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  static const String themeKey = 'theme_mode';

  ThemeModel() {
    _init();
  }

  _init() async {
    final savedTheme = await _loadThemeMode();
    if (savedTheme != null) {
      currentThemeMode = savedTheme;
      notifyListeners();
    }
  }

  /*------------------ Prefrense for theme ------------------*/
  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    try {
      print("this is $themeMode");
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(themeKey, themeMode.index);
    } catch (e) {
      print('Error saving theme mode: $e');
    }
  }

  Future<ThemeMode> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(themeKey);
      return ThemeMode.values[themeIndex ?? ThemeMode.light.index];
    } catch (e) {
      print('Error loading theme mode: $e');
      return ThemeMode.light; // Provide a default value if there's an error
    }
  }

  /*------------------------ provider value------------*/

  _toggleTheme(ThemeMode themeMode) async {
    debugPrint("this is called ${themeMode}");
    currentThemeMode = themeMode;
    await _saveThemeMode(currentThemeMode);
    notifyListeners();
  }

  void toggleTheme() async {
    try {
      // Toggle between light, dark, and system themes
      switch (currentThemeMode) {
        case ThemeMode.light:
          await _toggleTheme(ThemeMode.dark);
          break;
        case ThemeMode.dark:
          await _toggleTheme(ThemeMode.system);
          break;
        case ThemeMode.system:
          await _toggleTheme(ThemeMode.light);
          break;
      }
    } catch (e) {
      print('Error toggling theme: $e');
    }
  }

  Future<void> loadTheme() async {
    final savedThemeMode = await _loadThemeMode();
    if (savedThemeMode != null) {
      currentThemeMode = savedThemeMode;
      notifyListeners();
    }
  }

  /*------------------ light theme ----------------*/
  final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    // primaryColor: primaryLightColor,
    // primaryColorLight: Colors.blue[100],
    // primaryColorDark: primaryLightColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorDirectory.primaryLightColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 25.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: ColorDirectory.primarydarkColor,
    ),

    // buttonTheme: const ButtonThemeData(
    //   textTheme: ButtonTextTheme.normal,
    //   buttonColor: Colors.black,
    //   disabledColor: Colors.grey,
    //   padding: EdgeInsets.symmetric(horizontal: 16.0),
    // ),
    // iconTheme: const IconThemeData(
    //   color: Colors.black,
    //   size: 24.0,
    // ),
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    //   bodyMedium: TextStyle(fontSize: 16.0),
    //   titleMedium: TextStyle(fontSize: 18.0),
    // ),
    // appBarTheme: const AppBarTheme(
    //   color: Colors.blue,
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),
    // tabBarTheme: const TabBarTheme(
    //   labelColor: Colors.blue,
    //   unselectedLabelColor: Colors.grey,
    // ),
    // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
    //     .copyWith(background: Colors.white)
    //     .copyWith(error: Colors.red),
  );

/*------------------ dark theme ----------------*/
  final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: Colors.indigo,
    primaryColorLight: Colors.indigo[100],
    primaryColorDark: Colors.indigo[900],
    canvasColor: Colors.black,
    scaffoldBackgroundColor: ColorDirectory.primarydarkColor,
    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    ///textform firld///
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      // Set the background color of the input field
      labelStyle: TextStyle(color: Colors.white),
      // Set the text color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Set the border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.white), // Set the focused border color
      ),
      suffixIconColor: Colors.white,
    ),

    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.black,
      disabledColor: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
    ),
    // iconTheme: const IconThemeData(
    //   color: Colors.white,
    //   size: 24.0,
    // ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white),
      titleMedium: TextStyle(fontSize: 18.0, color: Colors.white),
    ),

    // appBarTheme: const AppBarTheme(
    //   color: Colors.indigo,
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),
    // tabBarTheme: const TabBarTheme(
    //   labelColor: Colors.indigo,
    //   unselectedLabelColor: Colors.grey,
    // ),
    // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
    //     .copyWith(background: Colors.black)
    //     .copyWith(error: Colors.red)
    //     .copyWith(secondary: Colors.amber),
  );
}
