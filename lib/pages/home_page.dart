import 'package:flutter/material.dart';
import 'package:movie/tiles/movie_info_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AspectRatio(aspectRatio: 2/3),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) return const MovieInfoTile();

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.red,
            height: 60,
          );
        },
      ),
    );
  }
}
