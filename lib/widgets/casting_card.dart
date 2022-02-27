import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, __){
          return _CastCard();
        }
        ),
    );
  }
}

class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/100x150'),
              fit: BoxFit.cover
              ),
          ),
            Text('movie.actor oyldnaa lorem lorem', 
            style: Theme.of(context).textTheme.subtitle2, 
            overflow: TextOverflow.ellipsis, maxLines: 2,
            textAlign: TextAlign.center,
            )
        ],

        ),
    );
  }
}
