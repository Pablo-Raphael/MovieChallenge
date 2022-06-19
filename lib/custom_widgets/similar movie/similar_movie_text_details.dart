import 'package:flutter/material.dart';

class SimilarMovieTextDetails extends StatelessWidget {
  final String text;

  const SimilarMovieTextDetails(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: Color.fromRGBO(255, 255, 255, 0.9),
      ),
    );
  }
}
