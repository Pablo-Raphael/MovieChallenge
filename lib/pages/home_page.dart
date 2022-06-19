import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/tiles/movie_info_tile.dart';
import 'package:movie/custom_widgets/similar%20movie/similar_movie.dart';

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
      body: StreamBuilder<Map<String, dynamic>>(
        stream: BlocProvider.of<MovieBloc>(context).outSimilar,
        builder: (context, snapshot) {
          // simplified code for easy access
          var snap = snapshot.data?["results"];

          return ListView.builder(
            // If the api has collected the data, the size of the ListView will\
            // be equal to the amount of data, otherwise the size will be 1
            itemCount: snap?.length != null ? snap.length + 1 : 1,

            padding: EdgeInsets.zero,

            itemBuilder: (context, index) {
              // The first position must be occupied by the movie information
              if (index == 0) return const MovieInfoTile();

              // Similar movies will be shown when Bloc loads API data
              if (snapshot.hasData) {
                return SimilarMovie(
                  id: snap[index - 1]["id"].toString(),
                  title: snap[index - 1]["title"],
                  posterPath: snap[index - 1]["poster_path"],
                  genres: snap[index-1]["genre_ids"],
                  avaliableGenres: snapshot.data!["genres"],
                  date: snap[index-1]["release_date"]
                );
              }

              // if snapshot has no data
              else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
