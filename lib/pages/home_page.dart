import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/tiles/movie_info_tile.dart';
import 'package:movie/custom_widgets/similar_movie/similar_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    BlocProvider.of<MovieBloc>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie banner and details
            const MovieInfoTile(),

            // Similar movies
            StreamBuilder<Map<String, dynamic>>(
              stream: BlocProvider.of<MovieBloc>(context).outSimilar,
              builder: (context, snapshot) {
                // simplified code for easy access
                List? snap = snapshot.data?["results"];

                // Similar movies will be shown when Bloc loads API data
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: snap!.map((value) {
                        return SimilarMovie(
                          id: value["id"].toString(),
                          title: value["title"],
                          posterPath: value["poster_path"],
                          genres: value["genre_ids"],
                          avaliableGenres: snapshot.data!["genres"],
                          date: value["release_date"],
                        );
                      },
                    ).toList(),
                  );
                }

                // if Movie Details snapshot has no data
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
