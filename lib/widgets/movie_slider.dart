
import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> popularMovies; 
  final String? title;
  const MovieSlider({Key? key, required this.popularMovies, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child:  Text(title!, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 18 ),)
            ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMovies.length,
              itemBuilder: (_, index) {
                final movie = popularMovies[index];
                return _MoviePoster(movie: movie,);
              }
              ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie ;
  const _MoviePoster({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'movie-params'),
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Container(
          height: double.infinity,
          width: 140,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.getPosterPath),
                  fit: BoxFit.cover,
                  ),
              ),
                Expanded(
                  child: Text(movie.title, 
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle( fontSize: 14),
                      ),
                )
              
            ],
          ),
        ),
      ),
    );
  }
}