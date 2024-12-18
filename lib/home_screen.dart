import 'package:flutter/material.dart';
import 'package:movie_app/tabs/movies_categories/movie_categories_item.dart';
import 'package:movie_app/tabs/movies_home/movies_home.dart';
import 'package:movie_app/tabs/search/search_screen.dart';
import 'package:movie_app/tabs/watched_list/watched_list_screen.dart';
import 'package:movie_app/theme_app.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    MoviesHomeScreen(),
    MovieSearchScreen(),
    MovieCategoryItems(),
    WatchedListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/homeicon.png'),
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/browse.png'),
              ),
              label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/watchlist.png'),
              ),
              label: 'WATCHELIST'),
        ],
      ),
    );
  }
}
