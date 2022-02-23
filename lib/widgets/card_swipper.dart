import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(

      width: double.infinity,
      height: size.height * 0.3,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: 10,
        itemHeight: size.height * 0.6,
        itemWidth: size.width * 0.4,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'details', arguments: 'Args');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/load.gif'), 
                  image: NetworkImage('https://via.placeholder.com/300x400'),
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