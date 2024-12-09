import 'package:flutter/material.dart';
import 'package:movie_app/home_screen.dart';
import 'package:movie_app/theme_app.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeApp.appTheme,
    );
  }
}
