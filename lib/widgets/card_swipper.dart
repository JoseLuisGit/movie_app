import 'package:flutter/material.dart';

import 'package:movie_app/models/models.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwipper extends StatelessWidget {

  final List<Movie> movies; 

  const CardSwipper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty){
      return Container(
        width: double.infinity,
        height: size.height * 0.40,
        child: const Center(
          child: CircularProgressIndicator(),),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: movies.length,
        itemHeight: size.height * 0.35,
        itemWidth: size.width * 0.5,
        itemBuilder: (_, index){
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'details', arguments: movie);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/load.gif'), 
                  image: NetworkImage(movie.getPosterPath),
                  fit: BoxFit.cover,
                  ),
              ),
            ),  
          );
        },
      )
      );
  }
}