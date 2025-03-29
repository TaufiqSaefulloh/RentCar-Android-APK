import 'package:flutter/material.dart';
import '../Provider/FavoriteProvider.dart';
import 'Detail.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    var favoriteCars = favoriteProvider.favoriteCars;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Items")),
      body:
          favoriteCars.isEmpty
              ? const Center(
                child: Text(
                  "Daftar Favorit Anda Kosong",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: favoriteCars.length,
                itemBuilder: (context, index) {
                  final car = favoriteCars[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(car.imageAsset, width: 50),
                      title: Text(car.name),
                      subtitle: Text(car.ticketPrice),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          favoriteProvider.toggleFavorite(car);
                        },
                      ),
                      onTap: () {
                        // Navigasi ke halaman detail saat item diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(car: car),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
