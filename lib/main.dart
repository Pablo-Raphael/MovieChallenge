import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => MovieBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Challenge',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      )
    );
  }
}
