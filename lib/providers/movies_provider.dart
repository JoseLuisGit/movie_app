import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/cast_movie_response.dart';

import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/popular_movies_response.dart';

class MoviesProvider extends ChangeNotifier {
  final _apiKey = 'a841e2c23fe58300a5d815470e79cdbe';
  final _language = 'es-ES';
  final _baseUrl = 'api.themoviedb.org';

  int _popularPage = 1;

  List<Movie> movies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast> > castMovies = {};

  MoviesProvider() {
    getOnDisplayMovies();
    getOnPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    NowPlayingResponse nowPlayingResponse =
        NowPlayingResponse.fromJson(jsonData);
    movies = nowPlayingResponse.results;

    notifyListeners();
  }

  getOnPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    PopularMoviesResponse nowPlayingResponse =
        PopularMoviesResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...nowPlayingResponse.results];

    notifyListeners();
  }

 Future<List<Cast>> getCastMovie(int movieId) async{

   if(castMovies.containsKey(movieId)){
      return castMovies[movieId]!;
   }
    final jsonData = await _getJsonData('3/movie/$movieId/credits');

    CastMovieResponse castMovieResponse = CastMovieResponse.fromJson(jsonData);


    castMovies = {...castMovies, movieId: castMovieResponse.cast};
    return castMovieResponse.cast;
  }
}
