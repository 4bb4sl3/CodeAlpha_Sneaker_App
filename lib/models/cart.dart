import 'package:flutter/widgets.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Cortez',
      price: '90',
      description:
          'The Nike Cortez was designed in 1972 by Nike cofounder Bill Bowerman to be lighter and more comfortable than any other.',
      imagePath: 'assets/images/Cortez.png',
    ),

    Shoe(
      name: 'Zoom',
      price: '140',
      description:
          'Supportive cushioning provides steadiness for everyday runs.',
      imagePath: 'assets/images/ZoomStructure.png',
    ),

    Shoe(
      name: 'AirJordan 1',
      price: '180',
      description:
          'The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel.',
      imagePath: 'assets/images/AirJordan 1.png',
    ),
    // Shoe(
    //   name: 'AirJordan\n31',
    //   price: '200',
    //   description:
    //       'The Air Jordan 31 pays honor to the past of the Air Jordan series.',
    //   imagePath: 'assets/images/AirJordan 31.png',
    // ),
  ];
  //list of items in user cart
  List<Shoe> userCart = [];
  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get what is in the cart
  List<Shoe> getuserCart() {
    return userCart;
  }

  //adding items to the cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //removing items from the cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
