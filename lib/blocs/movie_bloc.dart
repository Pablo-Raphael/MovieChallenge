import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:movie/helpers/shared_preferences_helper.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc {
  late ApiHelper api;
  late SharedHelper favorites;
  Map<int, String>? genres;

  final _searchController = StreamController<String>();
  Sink<String> get inSearch => _searchController.sink;

  final _infoController = BehaviorSubject<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get outInfo => _infoController.stream;

  final _similarController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get outSimilar => _similarController.stream;

  final _toggleFavoriteController = StreamController<String>.broadcast();
  Sink<String> get inToggleFav => _toggleFavoriteController.sink;

  final _favoritesController = BehaviorSubject<List<String>>();
  Stream<List<String>> get outFavList => _favoritesController.stream;

  Future<Map<int, String>> get getGenres async {
    if (genres != null) {
      return genres!;
    }
    else {
      var genres = await api.getGenres();
      Map<int, String> myMap = {};
      for (Map m in genres["genres"]) {
        myMap[m["id"]] = m["name"];
      }
      this.genres = myMap;
      return myMap;
    }
  }

  MovieBloc() : super(null) {
    api = ApiHelper();
    favorites = SharedHelper();

    _searchController.stream.listen(_searchInfo);
    _toggleFavoriteController.stream.listen(_toggleFavorite);

    inSearch.add("1771-captain-america-the-first-avenger");
    _asyncConstructor();
  }

  void _asyncConstructor() async {
    _favoritesController.sink.add(await favorites.getfavorites());
  }

  void _searchInfo(String id) async{
    // Return movie info
    Map<String, dynamic> details = await api.getMovieDetails(id);
    _infoController.sink.add(details);

    // Return similar movies with genres
    _similarController.sink.add({});
    Map<String, dynamic> similarMovies = await api.getSimilarMovies(id);
    similarMovies["genres"] = await getGenres;
    _similarController.sink.add(similarMovies);
  }

  void _toggleFavorite(String id) async {
    favorites.toggleFavorite(id);
    _favoritesController.sink.add(await favorites.getfavorites());
  }

  dispose() {
    _toggleFavoriteController.close();
    _favoritesController.close();
    _searchController.close();
    _infoController.close();
    _similarController.close();
  }
}