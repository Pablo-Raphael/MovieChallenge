import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:transparent_image/transparent_image.dart';

class SimilarMovie extends StatelessWidget {
  final String id;
  final String posterPath;
  final String title;

  const SimilarMovie({
    Key? key,
    required this.id,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 15,
      ),
      child: InkWell(
        onTap: () => BlocProvider.of<MovieBloc>(context).inSearch.add(id),
        child: Row(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              image: ApiHelper.bannerSearchLink(posterPath, lowQuality: true),
              placeholder: kTransparentImage,
              width: 65,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
