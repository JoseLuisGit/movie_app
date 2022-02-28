import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/models/models.dart';
import 'package:movie_app/providers/movies_provider.dart';

class SearchMovieDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', 
                        icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
  }


  Widget _emptyResults(){
    return const Center(
      child: Icon(
        Icons.movie_outlined,
        color: Colors.black54,
        size: 250,
      )
      );
  }

  @override
  Widget buildResults(BuildContext context) {
       MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);

    if (query.isEmpty) return _emptyResults();

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot){
        
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);

        List<Movie> movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index){
            Movie movie = movies[index];
            movie.heroId = 'search-${movie.id}';
            return Hero(
              tag: movie.heroId!,
              child: ListTile(
                leading: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.getPosterPath),
                  fit: BoxFit.cover,
                  width: 45,
                  height: double.infinity,
                  ),
                 title: Text(movie.title),
                 subtitle: Text(movie.originalTitle),
                 onTap: ()=>Navigator.pushNamed(context, 'details', arguments: movie),
              
              ),
            );
          }
          );
      },
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _emptyResults();

  }
}
