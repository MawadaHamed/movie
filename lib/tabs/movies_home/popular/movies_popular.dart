import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/popular/movie_popular_item.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MoviePopularList extends StatelessWidget {
  late Future<List<Results>> popularMovies;
  MoviePopularList(this.popularMovies);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingIndicator();
        }
        final movies = snapshot.data!;
        return CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, movieIndex) {
              final movie = movies[index];
              return MoviePopularItem(movie);
            },
            options: CarouselOptions(
                autoPlay: true, autoPlayInterval: Duration(seconds: 3)));
      },
    );
  }
}
