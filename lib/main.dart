import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MoviesProvider(),lazy: false)
      ],
      child: MyApp(),

      );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home' : (context)=> const HomeScreen(),
        'details': (context)=> DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.cyan
        )
      ),
    );
  }
}