import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/models/detalis_response/detalis_response.dart';
import 'package:movie_app/tabs/movies_home/movieDetails/related_movies/related_movies.dart';
import 'package:movie_app/theme_app.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen(this.detalisResponse, {super.key});
  DetalisResponse detalisResponse;
  List<Genres>? geners;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            detalisResponse.title ?? '',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              Image.network(
                'https://image.tmdb.org/t/p/original/${detalisResponse.backdropPath}',
                fit: BoxFit.cover,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ]),
            SizedBox(height: 5),
            Text(
              detalisResponse.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 5),
            Text(
              detalisResponse.releaseDate ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .35,
                    height: MediaQuery.sizeOf(context).height * .25,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original/${detalisResponse.posterPath}',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          detalisResponse.overview ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              '${detalisResponse.voteAverage}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(4),
                  color: ThemeApp.gray,
                  height: MediaQuery.sizeOf(context).height * .27,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'More Like This',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(child: MovieRelatedList()),
                    ],
                  )),
            ),
          ],
        ));
  }
}
