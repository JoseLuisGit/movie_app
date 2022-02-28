import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
       
  Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         _CustomAppBar( movie: movie,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterMovie( movie: movie,),
                _OverView(description: movie.overview,),
                CastingCard(movieId: movie.id,)
              ]
            )
            )
        ],
      )
      );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 280,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            )
          ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading_appbar.gif'), 
          image: NetworkImage(movie.getBackdropPath),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _PosterMovie extends StatelessWidget {

  final Movie movie ;

  const _PosterMovie({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
           FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(movie.getPosterPath),
            height: 200,
            width: 150,
            fit: BoxFit.cover,
            ),

            const SizedBox(
              width: 10,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textTheme.headline6, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis,),
                  Row(
                    children: [
                      const Icon(Icons.star_border_outlined, size: 15,),
                      Text(movie.voteAverage.toString(), style: textTheme.caption, overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                  Text(movie.releaseDate.toString(), style: textTheme.caption,)
                ],
                ),
            )
        ],
      ),
    );
  }
}


class _OverView extends StatelessWidget {
  final String description;

  const _OverView({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(description,
          style: Theme.of(context).textTheme.subtitle1, 
                textAlign: TextAlign.justify,
      ),
    );
  }
}