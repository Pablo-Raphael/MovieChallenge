import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  SharedPreferences? prefs;
  // used by the back button to find the previous movie
  List<String> stackMovies = ["1771-captain-america-the-first-avenger"];

  // access, initialize or create
  Future<SharedPreferences> get getPref async {
    // acess
    if (prefs != null) {
      return prefs!;
    }
    // initialize
    else {
      prefs = await SharedPreferences.getInstance();
      // create
      if (!prefs!.containsKey("favorites")) {
        prefs!.setStringList("favorites", []);
      }
      return prefs!;
    }
  }

  Future<List<String>> getfavorites() async {
    SharedPreferences sharedPref = await getPref;
    return sharedPref.getStringList("favorites")!;
  }

  void toggleFavorite(String id) async {
    SharedPreferences sharedPref = await getPref;

    var fav = sharedPref.getStringList("favorites");

    // add to favorites if not already
    if (fav!.contains(id)) {
      fav.remove(id);
      sharedPref.setStringList("favorites", fav);
    }
    // remove from favorites if it already exists
    else {
      fav.add(id);
      sharedPref.setStringList("favorites", fav);
    }
  }
}