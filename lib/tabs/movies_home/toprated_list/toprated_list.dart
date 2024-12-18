import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/toprated_list/toprated_item.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieTopRatedList extends StatelessWidget {
  late Future<List<Results>> TopRatedMovies;
  MovieTopRatedList(this.TopRatedMovies);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TopRatedMovies,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }
          final movies = snapshot.data!;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return TopRatedItem(movie);
            },
          );
        });
  }
}
