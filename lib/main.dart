import 'package:flutter/material.dart';
import 'package:movie_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home' : (context)=> const HomeScreen(),
        'details': (context)=> const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.cyan
        )
      ),
    );
  }
}