import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/product/produsctdetails.dart';
import '../../../Controller/detalis_products_controller.dart';
import '../../../Controller/produsct_controller.dart';
import '../sub_category/sub_category.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with TickerProviderStateMixin {
  final ProductsController controller = Get.put(ProductsController());

  late String subCategory;

  late TabController _tabController;
  int _previousTabIndex = 0;

  @override
  void initState() {
    super.initState();

    // استرجاع الفئة الفرعية من الحجج
    subCategory = Get.arguments ?? controller.categories[0];

    _tabController = TabController(
      initialIndex: controller.categories.indexOf(subCategory),
      length: controller.categories.length,
      vsync: this,
    );
    _tabController.addListener(_listenToTabChanges);

    // تحميل المنتجات للفئة الفرعية المختارة
    controller.getProductsBySubCategory(subCategory);
  }

  void _listenToTabChanges() {
    if (_previousTabIndex != _tabController.index) {
      _previousTabIndex = _tabController.index;

      // تحديث المنتجات للفئة الجديدة عند تغيير التبويب
      subCategory = controller.categories[_tabController.index];
      controller.getProductsBySubCategory(subCategory);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_listenToTabChanges);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        // backgroundColor: Colors.purple[50],
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // backgroundColor: Colors.purple[50],
          title: Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Obx(() {
              return TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: controller.categories.map((category) {
                  return Tab(
                    text: category,
                  );
                }).toList(),
              );
            }),
          ),
        ),
        body: Obx(() {
          return TabBarView(
            controller: _tabController,
            children: controller.categories.map((category) {
              return Column(
                children: [
                  // Subcategories section
                  Container(
                    height: Dimensions.height20 * 9,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Obx(() {
                      if (controller.isLoadingSubCategories.value) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final subCategories = controller.subCategories[category] ?? [];
                      if (subCategories.isEmpty) {
                        return Center(child: Text('No subcategories available'));
                      }

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: subCategories.map((subCategory) {
                            return GestureDetector(
                              onTap: () {
                                // تحديث الفئة الفرعية المختارة وعرض المنتجات المرتبطة بها
                                controller.getProductsBySubCategory(subCategory);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 120,
                                child: InkWell(
                                  onTap: () => Get.to(
                                        () => SubCategoryScreen(),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(controller.subCategoryImages[subCategory] ?? 'assets/images/default.png'),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        subCategory,
                                        style: TextStyle(fontSize: 14, color: Colors.purple),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ),
                  // Products section
                  Expanded(
                    child: Obx(() {
                      // التحقق مما إذا كان يتم تحميل المنتجات
                      if (controller.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                          ),
                        );
                      } else {
                        final products = controller.getProductsBySubCategory(category);

                        // التحقق مما إذا كانت المنتجات فارغة بعد التحميل
                        if (products.isEmpty) {
                          return Center(
                            child: Text(
                              'No products available in this category!',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else {
                          // يتم عرض المنتجات في GridView إذا كانت متاحة
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.5,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              final isEvenIndex = index % 2 == 0;

                              double height = isEvenIndex ? 200.0 : 100.0;

                              return Card(
                                elevation: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  ),
                                  height: height,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Hero(
                                          tag: 'productImage-${product.id}',
                                          child: Image.asset(
                                            product.imageUrl,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          product.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          '\$${product.price.toString()}',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          final productDetailController = Get.put(ProductDetailController());
                                          productDetailController.setProduct(product);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProductDetailPage(),
                                            ),
                                          );
                                        },
                                        child: Text('View Details'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    }),
                  ),

                ],
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}