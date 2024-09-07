import 'package:get/get.dart';
import '../Model/produsct_model.dart';


class FavoritesController extends GetxController {
  var favoritesList = <ProductModel>[].obs;

  void addToFavorites(ProductModel product) {
    if (!favoritesList.contains(product)) {
      favoritesList.add(product);
    }
  }

  void removeFromFavorites(ProductModel product) {
    favoritesList.remove(product);
  }
}
