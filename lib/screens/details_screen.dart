import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
       
  String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'not-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text('Tittle'),
                SizedBox(
                  height: 1000,
                )
              ]
            )
            )
        ],
      )
      );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: const Text(
            'movie.title',
            )
          ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading_appbar.gif'), 
          image: NetworkImage('https://via.placeholder.com/400x300'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}