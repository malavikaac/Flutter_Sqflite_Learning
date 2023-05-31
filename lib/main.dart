
import 'package:flutter/material.dart';

import 'Home.dart';
import 'add_film.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films',
      home: Home() ,
      routes: {
         "addfilm":(context)=>AddFilm(),
      },
    );
  }
}