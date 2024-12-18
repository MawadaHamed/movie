import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/models/detalis_response/detalis_response.dart';
import 'package:movie_app/tabs/movies_home/movieDetails/moviedetails_screen.dart';
import 'package:movie_app/widgets/erorr_indicator.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails(this.movieId, {super.key});
  final int movieId;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future<DetalisResponse> movieDetails;
  @override
  void initState() {
    movieDetails = ApiService.getMoviesDetlis(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError) {
          return ErrorIndicator();
        } else {
          final movie = snapshot.data!;
          return MovieDetailsScreen(movie);
        }
      },
    );
  }
}
