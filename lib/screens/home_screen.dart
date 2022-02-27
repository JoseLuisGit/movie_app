import 'package:flutter/material.dart';

import 'package:movie_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: const [
          Icon(Icons.search)
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwipper( movies: moviesProvider.movies,),
            MovieSlider(movies: moviesProvider.popularMovies, 
                        title: 'Populares',
                        onNextList: ()=>moviesProvider.getOnPopularMovies()
                        )
          ],
        ),
      ),
    );
  }
}