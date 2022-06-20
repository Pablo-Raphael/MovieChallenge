import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';
import 'package:movie/icons/custom_icons.py.dart';

class FavoriteButton extends StatelessWidget {
  final String id;
  final List<String> favorites;

  const FavoriteButton({
    Key? key,
    required this.id,
    required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: Icon(
        favorites.contains(id) ? HeartIcons.heart : HeartIcons.heart_empty,
        size: 24,
      ),
      onPressed: () {
        BlocProvider.of<MovieBloc>(context).inToggleFav.add(id);
      },
    );
  }
}
