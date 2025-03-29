import 'package:flutter/material.dart';
import '../model/Car.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Cars> _favoriteCars = [];

  List<Cars> get favoriteCars => _favoriteCars;

  void toggleFavorite(Cars car) {
    if (_favoriteCars.contains(car)) {
      _favoriteCars.remove(car);
    } else {
      _favoriteCars.add(car);
    }
    notifyListeners();
  }

  bool isFavorite(Cars car) {
    return _favoriteCars.contains(car);
  }
}
