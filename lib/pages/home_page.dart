import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:movie/tiles/movie_info_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder<Map<String, dynamic>>(
          stream: BlocProvider.of<MovieBloc>(context).outSimilar,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data?["results"]?.length != null
                  ? snapshot.data!["results"].length + 1
                  : 1,
              itemBuilder: (context, index) {
                if (index == 0) return const MovieInfoTile();

                if (snapshot.hasData) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        if (snapshot.hasData) {
                          BlocProvider.of<MovieBloc>(context).inSearch.add(
                                snapshot.data!["results"][index - 1]["id"]
                                    .toString(),
                              );
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            width: 65,
                            image: ApiHelper.bannerSearchLink(
                              snapshot.data!["results"][index - 1]
                                  ["poster_path"],
                              lowQuality: true,
                            ),
                          ),
                          Text(
                            snapshot.data!["results"][index - 1]["title"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ));
  }
}
