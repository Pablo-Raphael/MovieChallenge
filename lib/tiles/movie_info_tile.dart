import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/custom_widgets/fadein_image.dart';
import 'package:movie/custom_widgets/icon_text.dart';
import 'package:movie/custom_widgets/movie_title.dart';
import 'package:movie/custom_widgets/shaded_icon_button.dart';
import 'package:movie/icons/custom_icons.py.dart';

class MovieInfoTile extends StatelessWidget {
  const MovieInfoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: BlocProvider.of<MovieBloc>(context).outInfo,
      builder: (context, snapshot) {
        var snap = snapshot.data;

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
                snapshot.hasData
                    ? FadeImage(snap!["poster_path"], lowQuality: false)
                    : const SizedBox.shrink(),

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
                  Flexible(
                    flex: 4,
                    child: snapshot.hasData
                        ? MovieTitle(snap!["title"])
                        : const SizedBox.shrink(),
                  ),

                  // Favorite Button
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        HeartIcons.heart_empty,
                        size: 24,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Movie Statistics
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, bottom: 30),
              child: snapshot.hasData
                  ? Row(
                      children: <Widget>[
                        // Likes
                        IconText(
                          icon: HeartIcons.heart,
                          size: 15,
                          text: "${snap!["vote_count"]} Likes",
                        ),

                        const SizedBox(width: 25),

                        // Popularity
                        IconText(
                          icon: Icons.star_half,
                          size: 19,
                          text:
                              "${double.parse("${snapshot.data!["popularity"]}").toStringAsFixed(2)} Popularity",
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
