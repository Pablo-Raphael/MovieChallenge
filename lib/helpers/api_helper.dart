import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_KEY = "72d8d68396cb33afcdfd375447574f66";

class ApiHelper {
  static String bannerSearchLink(String path) {
    // low quality image
    // return "https://image.tmdb.org/t/p/w500/$path";

    // high quality image
    return "https://image.tmdb.org/t/p/original/$path";
  }

  static String infoSearchLink(String id) {
    return "https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY";
  }

  Future<Map<String, dynamic>> getMovieDetails(String id) async{
    Uri url = Uri.parse(infoSearchLink(id));
    http.Response response = await http.get(url);

    return json.decode(response.body);
  }
}