
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  MoviesProvider(){
    print('init movies provider');
    this.getOnDisplayMovies();
  }


  getOnDisplayMovies(){
    print('exec getOnDisplayMovies');
  }


}