import 'package:flutter/material.dart';
import 'package:movies/config/themes/light_theme.dart';
import 'package:movies/modules/movies/presentation/screens/movies_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: LightTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const MoviesScreen(),
    );
  }
}