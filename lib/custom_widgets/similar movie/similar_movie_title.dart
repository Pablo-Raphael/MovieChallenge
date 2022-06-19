import 'package:flutter/material.dart';

class SimilarMovieTitle extends StatelessWidget {
  final String title;
  const SimilarMovieTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.9),
        fontSize: 17.5,
        fontFamily: "SecularOne",
      ),
    );
  }
}
