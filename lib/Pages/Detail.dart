import 'package:flutter/material.dart';
import '../Provider/CartProvider.dart';
import '../model/Car.dart';
import '../model/FavoriteButton.dart';
import 'package:provider/provider.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final Cars car;

  const DetailScreen({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(car.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(car: car),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                car.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today, color: Colors.green),
                      const SizedBox(height: 8.0),
                      Text(car.openDays, style: informationTextStyle),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time, color: Colors.green),
                      const SizedBox(height: 8.0),
                      Text(car.openTime, style: informationTextStyle),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on, color: Colors.green),
                      const SizedBox(height: 8.0),
                      Text(car.price, style: informationTextStyle),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                car.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    car.imageUrls.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(car);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${car.name} ditambahkan ke keranjang"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna latar belakang tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                ),
                child: const Text(
                  'Tambahkan ke keranjang',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ), // Warna teks putih agar kontras
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}