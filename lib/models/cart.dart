import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/consts.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  final List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '236',
      imagepath: AppImages.shoe1,
      description: 'The forward-thinking design of his last signature shoe',
    ),
    Shoe(
      name: 'Air Jordans',
      price: '228',
      imagepath: AppImages.shoe2,
      description: 'You\'ve got the hops and the speed. Lace up in shoes that enhance.',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      imagepath: AppImages.shoe3,
      description: 'A secure midfoot is suited for scoring binges and defense.',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '190',
      imagepath: AppImages.shoe4,
      description: 'The forward-thinking design of his last signature shoe.',
    ),
  ];

  // User cart
  final List<Shoe> userCart = [];

  // Get shop list
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  // Get total price
  double getTotalPrice() {
    return userCart.fold(
      0,
      (total, shoe) => total + (double.tryParse(shoe.price) ?? 0),
    );
  }
}