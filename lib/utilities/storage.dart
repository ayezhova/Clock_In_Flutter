import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  SharedPreferences preferences;


  initStorage() async {
    preferences = await SharedPreferences.getInstance();
  }

  Storage () {
    initStorage();
  }

  clearVisitingFlag() async {
    await preferences.remove("alreadyVisited");
  }

  setVisitingFlag() async {
    preferences.setBool("alreadyVisited", true);
  }

  Future<bool> getVisitingFlag() async {
    bool alreadyVisited = preferences.getBool("alreadyVisited") ?? false;
    return alreadyVisited;
  }
}