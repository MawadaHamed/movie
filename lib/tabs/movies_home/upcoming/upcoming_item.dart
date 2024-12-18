import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/movieDetails/moviedetails.dart';

class UpComingItem extends StatelessWidget {
  UpComingItem(this.movie, {super.key});
  Results movie;

  @override
  Widget build(BuildContext context) {
    int? movieId = movie.id;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(right: 6),
      width: width * .25,
      height: height * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(movieId!),
              ));
        },
        child: Image.network(
            'https://image.tmdb.org/t/p/original/${movie.posterPath}'),
      ),
    );
  }
}
