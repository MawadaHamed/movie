import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/detalis_response/detalis_response.dart';
import 'package:movie_app/models/popular_response/results.dart';

class ApiService {
  final String apiKey = 'd2c2a39ec98cc20d1a4dbb968112a70c';
  static Future<List<Results>> getPopularMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=${ApiService().apiKey}'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      List<Results> movies =
          jsonData.map((json) => Results.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  static Future<List<Results>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiService().apiKey}'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      List<Results> movies =
          jsonData.map((json) => Results.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<List<Results>> getTopReatedMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiService().apiKey}'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      List<Results> movies =
          jsonData.map((json) => Results.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  static Future<List<Results>> getrelatedMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/related?api_key=${ApiService().apiKey}'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      List<Results> movies =
          jsonData.map((json) => Results.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  static Future<DetalisResponse> getMoviesDetlis(int movieId) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=${ApiService().apiKey}'));

    if (response.statusCode == 200) {
      return DetalisResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies details');
    }
  }
}
