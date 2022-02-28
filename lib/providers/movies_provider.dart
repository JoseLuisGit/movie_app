import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/helpers/debouncer.dart';

import 'package:movie_app/models/cast_movie_response.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/popular_movies_response.dart';
import 'package:movie_app/models/search_movie_response.dart';

class MoviesProvider extends ChangeNotifier {
  final _apiKey = 'a841e2c23fe58300a5d815470e79cdbe';
  final _language = 'es-ES';
  final _baseUrl = 'api.themoviedb.org';

  int _popularPage = 0;

  final debounced = Debouncer(duration: Duration(milliseconds: 500));

  StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      this._suggestionStreamController.stream;

  List<Movie> movies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> castMovies = {};

  MoviesProvider() {
    getOnDisplayMovies();
    getOnPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
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

  Future<List<Cast>> getCastMovie(int movieId) async {
    if (castMovies.containsKey(movieId)) {
      return castMovies[movieId]!;
    }
    final jsonData = await _getJsonData('3/movie/$movieId/credits');

    CastMovieResponse castMovieResponse = CastMovieResponse.fromJson(jsonData);

    castMovies = {...castMovies, movieId: castMovieResponse.cast};
    return castMovieResponse.cast;
  }

  Future<List<Movie>> searchMovies(String searchWord) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': searchWord});

    final response = await http.get(url);

    SearchMovieResponse searchMovieResponse =
        SearchMovieResponse.fromJson(response.body);

    return searchMovieResponse.results;
  }

  void suggestionStreamByQuery(String searchTherm) {
    debounced.value = '';
    debounced.onValue = (value) async {
      final results = await this.searchMovies(value);

      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debounced.value = searchTherm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
