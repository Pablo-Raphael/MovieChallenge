import 'package:flutter/material.dart';
import 'package:movie/customized_icons/icon_text.dart';
import 'package:movie/icons/custom_icons.py.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AspectRatio(aspectRatio: 2/3),
      backgroundColor: Colors.black,
      body: ListView(children: <Widget>[
        Container(
          // Fade Effect
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

          child: Stack(
            children: <Widget>[
              Image.network(
                "https://image.tmdb.org/t/p/original/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg",
              ),

              // BackButton
              const Positioned(
                left: 20,
                top: 65,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Flexible(
                flex: 4,
                child: Text(
                  "Spider-Man: No Way Home",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontFamily: "SignikaNegative", // "SecularOne",
                      letterSpacing: 0.9),
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(HeartIcons.heart_empty, size: 24),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15, top: 8),
          child: Row(
            children: const <Widget>[
              IconText(icon: HeartIcons.heart, size: 15, text: "xxxxxxxx"),
              SizedBox(width: 25),
              IconText(icon: Icons.star_half, size: 19, text: "xxxxxxxx"),
            ],
          ),
        ),
      ]),
    );
  }
}
