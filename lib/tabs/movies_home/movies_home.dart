import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/popular/movies_popular.dart';
import 'package:movie_app/tabs/movies_home/upcoming/upcoming_list.dart';
import 'package:movie_app/theme_app.dart';

import 'toprated_list/toprated_list.dart';

class MoviesHomeScreen extends StatefulWidget {
  const MoviesHomeScreen({super.key});

  @override
  State<MoviesHomeScreen> createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {
  late Future<List<Results>> PopularMovies;
  late Future<List<Results>> upComingMovies;
  late Future<List<Results>> TopRatedMovies;
  @override
  void initState() {
    PopularMovies = ApiService.getPopularMovies();
    upComingMovies = ApiService.getUpcomingMovies();
    TopRatedMovies = ApiService.getTopReatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePopularList(PopularMovies),
            Container(
                margin: EdgeInsets.all(4),
                color: ThemeApp.gray,
                height: height * .25,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8),
                      child: Text(
                        'New Release',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 18),
                      ),
                    ),
                    Expanded(child: MovieUpComingList(upComingMovies)),
                  ],
                )),
            Text('Recommended'),
            Container(
                margin: EdgeInsets.all(4),
                color: ThemeApp.gray,
                height: height * .32,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, bottom: 4),
                      child: Text(
                        'Recommended',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(child: MovieTopRatedList(TopRatedMovies)),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
