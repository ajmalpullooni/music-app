import 'package:flutter/widgets.dart';

class SongmodelProvider with ChangeNotifier {
  int _id = 0;

  int get id => _id;
  void setId(int id) {
    notifyListeners();
  }
}
 