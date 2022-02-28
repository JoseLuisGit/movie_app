import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/providers/movies_provider.dart';

import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  const CastingCard({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getCastMovie(movieId),
      builder: (context,snapshot){

        if(!snapshot.hasData){
          return const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            )
          );
        }

        final List<Cast> cast = snapshot.data as List<Cast>;
      return Container(
      width: double.infinity,
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (_, index){
          return _CastCard(cast: cast[index],);
        }
        ),
    );
      }
      );


  }
}

class _CastCard extends StatelessWidget {

  final Cast cast;

  const _CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      height: double.infinity,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(cast.getFullProfilePath),
              fit: BoxFit.cover,
              width: 100,
              height: 150,
              ),
          ),
            Text(cast.originalName, 
            style: Theme.of(context).textTheme.subtitle2, 
            overflow: TextOverflow.ellipsis, maxLines: 2,
            textAlign: TextAlign.center,
            ),
            Expanded(child: Text(cast.character?? 'not name', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis,))
        ],

        ),
    );
  }
}
