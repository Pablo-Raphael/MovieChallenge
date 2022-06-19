import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc {
  late ApiHelper api;

  final _searchController = StreamController<String>();
  Sink<String> get inSearch => _searchController.sink;

  final _infoController = BehaviorSubject<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get outInfo => _infoController.stream;

  final _similarController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get outSimilar => _similarController.stream;

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
    _similarController.sink.add(similarMovies);
  }

  dispose() {
    _searchController.close();
    _infoController.close();
  }
}