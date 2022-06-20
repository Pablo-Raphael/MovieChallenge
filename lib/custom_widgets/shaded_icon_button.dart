import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/movie_bloc.dart';

class ShadedIconButton extends StatelessWidget {
  const ShadedIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black54,
      child: IconButton(
        onPressed: (){
          var bloc = BlocProvider.of<MovieBloc>(context);
          if (bloc.favorites.stackMovies.length > 1) {
            bloc.favorites.stackMovies.removeLast();
            bloc.inSearch.add(bloc.favorites.stackMovies.last);
          }
        },
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
