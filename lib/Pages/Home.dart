import 'package:flutter/material.dart';
import 'Detail.dart';
import '../model/Car.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garasi Rent Car', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.yellow,
            onPressed: () {
              print("Search");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.yellow,
          onPressed: () {
            print("Menu");
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Cars car = CarsList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(car: car);
                  },
                ),
              );
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(flex: 1, child: Image.asset(car.imageAsset)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            car.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            car.ticketPrice,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: CarsList.length,
      ),
    );
  }
}
