import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/customized_icons/icon_text.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:movie/icons/custom_icons.py.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieInfoTile extends StatelessWidget {
  const MovieInfoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
              // A widget with the same size of the image, to wait the loading
              const AspectRatio(
                aspectRatio: 2 / 3,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),

              StreamBuilder<Map<String, dynamic>>(
                stream: BlocProvider.of<MovieBloc>(context).outInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Banner with fade-in animation
                    return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: ApiHelper.bannerSearchLink(
                            snapshot.data!["poster_path"],
                        ),);
                  } else {
                    // Empty widget
                    return const SizedBox.shrink();
                  }
                },
              ),

              // BackButton above the Banner
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
              Flexible(
                flex: 4,
                child: StreamBuilder<Map<String, dynamic>>(
                  stream: BlocProvider.of<MovieBloc>(context).outInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!["title"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 32,
                            fontFamily: "SignikaNegative", // "SecularOne",
                            letterSpacing: 0.9),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(HeartIcons.heart_empty, size: 24),
                  color: Colors.white,
                  onPressed: () async {
                    //print(await ApiHelper().getMovieDetails("1771-captain-america-the-first-avenger"));
                  },
                ),
              ),
            ],
          ),
        ),

        // Movie statistics
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
      ],
    );
  }
}
