import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  SharedPreferences? prefs;

  Future<SharedPreferences> get getPref async {
    if (prefs != null) {
      return prefs!;
    }
    else {
      prefs = await SharedPreferences.getInstance();
      if (!prefs!.containsKey("favorites")) {
        prefs!.setStringList("favorites", []);
      }
      return prefs!;
    }
  }

  Future<List<String>> getfavorites() async {
    print("Entrou nos favoritos");
    SharedPreferences sharedPref = await getPref;
    return sharedPref.getStringList("favorites")!;
  }

  void toggleFavorite(String id) async {
    print("entrou no SP");
    SharedPreferences sharedPref = await getPref;
    var fav = sharedPref.getStringList("favorites");
    if (fav!.contains(id)) {
      print(fav);
      fav.remove(id);
      print(fav);
      sharedPref.setStringList("favorites", fav);
    } else{
      print(fav);
      fav.add(id);
      print(fav);
      sharedPref.setStringList("favorites", fav);
    }
  }
}