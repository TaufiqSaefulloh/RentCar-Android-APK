import 'package:flutter/material.dart';
import 'Provider/CartProvider.dart';
import 'Pages/Cart.dart';
import 'Pages/Home.dart';
import 'Pages/Favorite.dart';
import 'Provider/FavoriteProvider.dart';
import 'package:provider/provider.dart';
// import 'package:myapp/Pages/Profile.dart' show Profile;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ), // Tambahkan ini
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    FavoritePage(),
    CartPage() // Add this line
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garasi Rent Car',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Oswald'),
      home: Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Pesanan'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow,
          onTap: _onItemTapped,
        ),
      ),
      // home: MainScreen(),
    );
  }
}
