import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/toprated_list/toprated_item.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieRelatedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getTopReatedMovies(),
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
