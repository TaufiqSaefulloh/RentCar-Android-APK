import 'package:flutter/material.dart';
import '../Provider/FavoriteProvider.dart';
import 'Car.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final Cars car;

  const FavoriteButton({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.isFavorite(car);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        favoriteProvider.toggleFavorite(car);
      },
    );
  }
}
