import 'package:get/get.dart';
import 'package:get_x_lib/model/product.dart';

class CartController extends GetxController{
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + item.price);

  addToCart(Product product){
    cartItems.add(product);
  }

  void removeFromCart(int id){
    cartItems.removeWhere((item) => item.id == id);
  }
}