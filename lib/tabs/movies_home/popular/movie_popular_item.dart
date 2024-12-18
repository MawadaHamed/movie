import 'package:flutter/material.dart';
import 'package:movie_app/tabs/movies_home/movieDetails/moviedetails.dart';

import '../../../models/popular_response/results.dart';

class MoviePopularItem extends StatelessWidget {
  Results movie;
  MoviePopularItem(this.movie);

  @override
  Widget build(BuildContext context) {
    int? movieId = movie.id;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(movieId!),
                ));
          },
          child: Image.network(
            'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: height * .17,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * .2,
                  height: height * .45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.title ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      movie.releaseDate ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
