import 'package:flutter/material.dart';
import 'package:movie/icons/custom_icons.py.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  stops: [0.85, 1],
                ),
              ),
              child: Image.network(
                  "https://image.tmdb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
              ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Flexible(
                  flex: 4,
                  child: Text(
                    "Spider-Man: No Way Home",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: "SignikaNegative", // "SecularOne",
                        letterSpacing: 0.9
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: const Icon(HeartIcons.heart_empty, size: 24),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
