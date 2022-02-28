
import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies; 
  final String? title;
  final Function onNextList;
  const MovieSlider({Key? key, required this.movies, this.title, required this.onNextList}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200){
        widget.onNextList();
      }
    });
    super.initState();
  }
   

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
            Padding(
              padding:  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child:  Text(widget.title!, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 18 ),)
            ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, index) {
                final movie = widget.movies[index];
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
    movie.heroId = 'slider-${movie.id}';
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, 'details', arguments: movie),
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Container(
          height: double.infinity,
          width: 140,
          child: Column(
            children: [
              Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'), 
                    image: NetworkImage(movie.getPosterPath),
                    fit: BoxFit.cover,
                    ),
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