import 'package:flutter/material.dart';

import 'package:movie_app/models/models.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwipper extends StatelessWidget {

  final List<Movie> movies; 

  const CardSwipper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: movies.length,
        itemHeight: size.height * 0.35,
        itemWidth: size.width * 0.5,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'details', arguments: 'Args');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/load.gif'), 
                  image: NetworkImage(movies[index].getPosterPath),
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