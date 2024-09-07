import 'package:get/get.dart';
import '../Model/produsct_model.dart'; // تأكد من المسار الصحيح

class ProductDetailController extends GetxController {
  var selectedProduct = ProductModel(
    id: 0,
    name: '',
   // description: '',
    imageUrl: 'assets/images/camera1.png',
    price: 0.0,
   // category: '',
  ).obs;

  void setProduct(ProductModel product) {
    this.selectedProduct.value = product;
  }
}
