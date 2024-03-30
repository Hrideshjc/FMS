import 'package:VMS/module/home_page/bottomnavdar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:VMS/provider/app_provider.dart';
import 'package:VMS/theme/theme.dart';

import 'config/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // Initialize the SharedPreferences
  // await ThemeModel().loadTheme();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: Consumer<ThemeModel>(
        builder: (context, appTheme, _) {
          return MaterialApp(
            // theme: ThemeData.light(), // Default light theme
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.system,
            theme: context.watch<ThemeModel>().lightTheme,
            darkTheme: context.watch<ThemeModel>().darkTheme,
            themeMode: context.watch<ThemeModel>().currentThemeMode,

            title: "FMS",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initial,
            routes: AppPages.routes,
            
          );
        },
      ),
    );
  }
}
