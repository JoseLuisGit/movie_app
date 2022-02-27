
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  final _apiKey = 'a841e2c23fe58300a5d815470e79cdbe';
  final _language = 'es-ES';
  final _baseUrl = 'api.themoviedb.org';

  MoviesProvider(){
    print('init movies provider');
    getOnDisplayMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '1'
    });

    final response = await http.get(url);

    final decodedData = json.decode(response.body);

    print(decodedData);

  }


}