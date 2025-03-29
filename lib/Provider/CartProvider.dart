import 'package:flutter/material.dart';
import '../model/Car.dart';

class CartItem {
  final Cars car;
  int quantity;
  

  CartItem({required this.car, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Cars car) {
    var existingItem = _cartItems.indexWhere(
      (item) => item.car.name == car.name,
    );
    if (existingItem != -1) {
      _cartItems[existingItem].quantity += 1;
    } else {
      _cartItems.add(CartItem(car: car, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Cars car) {
    _cartItems.removeWhere((item) => item.car.name == car.name);
    notifyListeners();
  }

  void updateQuantity(Cars car, int newQuantity) {
    var index = _cartItems.indexWhere((item) => item.car.name == car.name);
    if (index != -1 && newQuantity > 0) {
      _cartItems[index].quantity = newQuantity;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
