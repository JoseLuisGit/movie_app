import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.cyanAccent, 
      width: double.infinity,
      height: size.height * 0.3,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: 10,
        itemHeight: size.height * 0.6,
        itemWidth: size.width * 0.4,
        itemBuilder: (_, index){
          return const FadeInImage(
            placeholder: AssetImage('assets/load.gif'), 
            image: NetworkImage('https://via.placeholder.com/300x400'));
        },
      )
      );
  }
}