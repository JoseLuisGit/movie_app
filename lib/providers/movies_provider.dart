
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/popular_movies_response.dart';

class MoviesProvider extends ChangeNotifier{

  final _apiKey = 'a841e2c23fe58300a5d815470e79cdbe';
  final _language = 'es-ES';
  final _baseUrl = 'api.themoviedb.org';

  List<Movie> movies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){
    getOnDisplayMovies();
    getOnPopularMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '1'
    });

    final response = await http.get(url);

    NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    movies = nowPlayingResponse.results;

    notifyListeners();
  }

   getOnPopularMovies() async{
      var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '1'
    });

    final response = await http.get(url);

    PopularMoviesResponse nowPlayingResponse = PopularMoviesResponse.fromJson(response.body);
    popularMovies = [ ...popularMovies, ...nowPlayingResponse.results];

    notifyListeners();

    }

}