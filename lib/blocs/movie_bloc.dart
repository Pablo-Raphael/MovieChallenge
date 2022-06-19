import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc {
  late ApiHelper api;
  Map<int, String>? genres;

  final _searchController = StreamController<String>();
  Sink<String> get inSearch => _searchController.sink;

  final _infoController = BehaviorSubject<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get outInfo => _infoController.stream;

  final _similarController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get outSimilar => _similarController.stream;

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
    inSearch.add("1771-captain-america-the-first-avenger");
    api = ApiHelper();
    _searchController.stream.listen(_searchInfo);
  }

  void _searchInfo(String id) async{
    Map<String, dynamic> details = await api.getMovieDetails(id);
    _infoController.sink.add(details);

    _similarController.sink.add({});
    Map<String, dynamic> similarMovies = await api.getSimilarMovies(id);
    similarMovies["genres"] = await getGenres;
    _similarController.sink.add(similarMovies);
  }

  dispose() {
    _searchController.close();
    _infoController.close();
    _similarController.close();
  }
}