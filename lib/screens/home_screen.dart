import 'package:flutter/material.dart';

import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: const [
          Icon(Icons.search)
        ],
        elevation: 0,
      ),
      body: Column(
        children: const [
          CardSwipper()
        ],
      ),
    );
  }
}