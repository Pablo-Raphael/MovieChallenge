import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  const MovieTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: const TextStyle(
          color: Colors.white,
          //fontWeight: FontWeight.bold,
          fontSize: 32,
          fontFamily: "SignikaNegative", // "SecularOne",
          letterSpacing: 0.9),
    );
  }
}
