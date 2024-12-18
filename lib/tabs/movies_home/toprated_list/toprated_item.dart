import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_response/results.dart';
import 'package:movie_app/tabs/movies_home/movieDetails/moviedetails.dart';
import 'package:movie_app/theme_app.dart';

class TopRatedItem extends StatelessWidget {
  TopRatedItem(this.movie, {super.key});
  Results movie;

  @override
  Widget build(BuildContext context) {
    int? movieId = movie.id;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(right: 6),
      width: width * .25,
      height: height * .6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 6),
        width: width * .25,
        height: height * .6,
        decoration: BoxDecoration(
          color: ThemeApp.gray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            GestureDetector(
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
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "${movie.voteAverage}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(
              movie.title ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              movie.releaseDate ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
