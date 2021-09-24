import 'package:get/get.dart';
import 'package:get_x_lib/model/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1),);
    var productResult = [
      Product(1, "Scala", "productImage", "productDescription", 30),
      Product(2, "Ruby", "productImage", "productDescription", 40),
      Product(3, "Sapphire", "productImage", "productDescription", 40.9),
      Product(4, "Diamond", "productImage", "productDescription", 50),
    ];

    products.value = productResult;
  }
}