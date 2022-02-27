import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
       
  String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'not-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterMovie(),
                _OverView(),
                _OverView(),
                CastingCard()
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
          padding: const EdgeInsets.only(bottom: 10),
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

class _PosterMovie extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage('https://via.placeholder.com/300x400'),
            height: 200,
            ),

            const SizedBox(
              width: 10,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('movie.title', style: textTheme.headline6, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text('movie.originalName', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    const Icon(Icons.star_border_outlined, size: 15,),
                    Text('move.caption', style: textTheme.caption, overflow: TextOverflow.ellipsis,)
                  ],
                )
              ],
              )
        ],
      ),
    );
  }
}


class _OverView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('Dolor ad non et anim. Proident pariatur culpa qui tempor fugiat cillum. Voluptate laboris cillum velit ad et. Est tempor laboris incididunt nisi. Consectetur deserunt ut proident proident. Nulla veniam deserunt velit qui consequat. Cupidatat nostrud ullamco non nulla consequat consequat enim reprehenderit.',
          style: Theme.of(context).textTheme.subtitle1, 
                textAlign: TextAlign.justify,
      ),
    );
  }
}