import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/custom_widgets/fadein_image.dart';
import 'package:movie/custom_widgets/similar_movie/similar_movie_text_details.dart';
import 'package:movie/custom_widgets/similar_movie/similar_movie_title.dart';
import 'package:movie/icons/custom_icons.py.dart';

class SimilarMovie extends StatelessWidget {
  final String id;
  final String posterPath;
  final String title;
  final List genres;
  final String date;

  final Map<int, String> avaliableGenres;

  const SimilarMovie({
    Key? key,
    required this.id,
    required this.date,
    required this.title,
    required this.posterPath,
    required this.genres,
    required this.avaliableGenres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: InkWell(
        onTap: () {
          BlocProvider.of<MovieBloc>(context).favorites.stackMovies.add(id);
          BlocProvider.of<MovieBloc>(context).inSearch.add(id);
        },
        child: Row(
          children: <Widget>[
            FadeImage(posterPath, width: 65, lowQuality: true),

            // Widget to space
            const SizedBox(width: 16),

            // Similar Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SimilarMovieTitle(title),
                  ),

                  // Widget to space
                  const SizedBox(height: 4),

                  // Year and Genres
                  Row(
                    children: [
                      SimilarMovieTextDetails(DateTime.parse(date).year.toString()),
                      const SizedBox(width: 8),
                      SimilarMovieTextDetails(generateGenreText(genres, avaliableGenres)),
                    ],
                  )
                ],
              ),
            ),

            StreamBuilder<List<String>>(
              stream: BlocProvider.of<MovieBloc>(context).outFavList,
              builder: (context, favoriteList) {
                if (favoriteList.hasData) {
                  return favoriteList.data!.contains(id)
                      ? const Icon(HeartIcons.heart, size: 12, color: Colors.white)
                      : const SizedBox.shrink();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// transforms integer list of genres into a formatted string
// [1, 2, 3, 4]  ->  "1, 2, 3, 4"
String generateGenreText(List genres, Map<int, String> avaliableGenres) {
  String formatted = "";
  for (int genre in genres.take(2)) {
    if (genre != genres.take(2).last) {
      formatted += "${avaliableGenres[genre]}, ";
    } else {
      formatted += "${avaliableGenres[genre]}";
      break;
    }
  }
  return formatted;
}
