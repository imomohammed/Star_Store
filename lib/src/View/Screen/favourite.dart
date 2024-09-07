import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/home/home.dart';
import 'package:star/src/Widgets/icons/circular_icon.dart';
import '../../Controller/favoritescontroller.dart';
import '../../Widgets/t_appbar.dart';


class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with SingleTickerProviderStateMixin {
  final FavoritesController controller = Get.put(FavoritesController());
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation when the page is initialized
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favorites',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black87),),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return FadeTransition(
            opacity: _animation,
            child: Center(
              child: Text('No favorites added yet!',style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.bold),),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.favoritesList.length,
            itemBuilder: (context, index) {
              final product = controller.favoritesList[index];
              if (product == null) {
                return Container(); // أو قم بعرض رسالة خطأ أو شيء ما هنا
              }
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: Dimensions.width10-2, horizontal: Dimensions.height10),
                child: ListTile(
                  leading: Hero(
                    tag: 'productImage-${product.id}',
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: 50,
                    ),
                  ),
                  title: Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text('\$${product.price.toString()}', style: TextStyle(color: Colors.green, fontSize: 16)),
                  trailing: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: Dimensions.width10*5,
                    height: Dimensions.height10*5,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(Dimensions.radius20+5),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.removeFromFavorites(product);
                      },
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
