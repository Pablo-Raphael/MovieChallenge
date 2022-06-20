import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/custom_widgets/fadein_image.dart';
import 'package:movie/custom_widgets/icon_text.dart';
import 'package:movie/custom_widgets/movie_title.dart';
import 'package:movie/custom_widgets/shaded_icon_button.dart';
import 'package:movie/icons/custom_icons.py.dart';

class MovieInfoTile extends StatelessWidget {
  final List<String> favorites;

  const MovieInfoTile({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: BlocProvider.of<MovieBloc>(context).outInfo,
      builder: (context, snapshot) {
        var snap = snapshot.data;

        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              // Movie Banner
              Stack(
                children: <Widget>[
                  // A widget with the same size as the image, so the screen\
                  // doesn't shrink when loading
                  const AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),

                  // Banner Image loaded with BLoC
                  FadeImage(snap!["poster_path"], lowQuality: false),

                  // BackButton above the Banner
                  const Positioned(
                    left: 20,
                    top: 65,
                    child: ShadedIconButton(),
                  ),
                ],
              ),

              // Movie Title and Like Button
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Movie Title
                    Flexible(flex: 4, child: MovieTitle(snap["title"])),

                    // Favorite Button
                    Flexible(
                      flex: 1,
                      child: StreamBuilder<List<String>>(
                        initialData: favorites,
                        stream: BlocProvider.of<MovieBloc>(context).outFavList,
                        builder: (context, favoriteList) {
                          return IconButton(
                            icon: Icon(
                              favoriteList.data!.contains("${snap["id"]}")
                                  ? HeartIcons.heart
                                  : HeartIcons.heart_empty,
                              size: 24,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              toggleFavorite(context, snap["id"]);
                            }
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Movie Statistics
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8, bottom: 30),
                child: Row(
                  children: <Widget>[
                    // Likes
                    IconText(
                      icon: HeartIcons.heart,
                      size: 15,
                      text: formatLikeNumber(snap["vote_count"].toString()),
                    ),

                    const SizedBox(width: 25),

                    // Popularity
                    IconText(
                      icon: Icons.star_half,
                      size: 19,
                      text:
                          "${double.parse("${snap["popularity"]}").toStringAsFixed(2)} Popularity",
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

void toggleFavorite(BuildContext context, var id) {
  BlocProvider.of<MovieBloc>(context).inToggleFav.add(id.toString());
}

// Turns 18754 number into 18.7k string
String formatLikeNumber(String likes) {
  String formatted = "";

  if (double.parse(likes) >= 1000) {
    formatted += "${(double.parse(likes) / 1000).toStringAsFixed(1)}k";
  } else {
    formatted += likes;
  }

  return formatted += " Likes";
}
