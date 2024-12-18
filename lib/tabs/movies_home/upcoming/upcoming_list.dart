import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/upcoming/upcoming_item.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieUpComingList extends StatelessWidget {
  late Future<List<Results>> upComingMovies;
  MovieUpComingList(this.upComingMovies);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upComingMovies,
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
            return UpComingItem(movie);
          },
        );
      },
    );
  }
}
