//
// import 'package:get/get.dart';
// import 'package:star/src/Model/produsct_model.dart';
// import '../Model/categories_model.dart';
//
//
// class CategoryController extends GetxController {
//   var categories = <CategoryModel>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }
//
//   void fetchCategories() {
//     categories.assignAll([
//       CategoryModel(
//         id: 1,
//         name: "Electronics",
//         imageUrl: "assets/images/lap1.png", // مسار الصورة
//         subCategories: [
//           SubCategory(id: 1, name: "Mobile Phones",imageUrl:"assets/images/phon1.png"),
//           SubCategory(id: 2, name: "Laptops",imageUrl:"assets/images/lap2.png"),
//         ],
//       ),
//       CategoryModel(
//         id: 2,
//         name: "Fashion",
//         imageUrl: "assets/images/fash.png", // مسار الصورة
//         subCategories: [
//           SubCategory(id: 3, name: "Men's Clothing",imageUrl:"assets/images/men.png"),
//           SubCategory(id: 4, name: "Women's Clothing",imageUrl:"assets/images/girl.png"),
//         ],
//       ),
//     ]);
//   }
//
//
//   void goToProductsByCategory(SubCategory subCategory) {
//     // الانتقال إلى صفحة المنتجات بناءً على الفئة الفرعية المختارة
//     // Get.to(() => Product(subCategory: subCategories));
//   }
//}
import 'package:get/get.dart';
import '../Model/produsct_model.dart'; // تأكد من المسار الصحيح

class CategoriesController extends GetxController {
  var categories = <String>[].obs; // قائمة الفئات الرئيسية
  var subCategories = <String, List<String>>{}.obs; // فئات فرعية لكل فئة رئيسية
  var products = <String, List<ProductModel>>{}.obs; // المنتجات لكل فئة فرعية
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // تحميل الفئات عند بدء تشغيل التطبيق
  }

  void fetchCategories() {
    // استرجاع الفئات الرئيسية من مصدر البيانات
    categories.assignAll(['Electronics', 'Clothing', 'Phones','Women','Men','Kids','Home']);
    // استرجاع الفئات الفرعية لكل فئة رئيسية
    subCategories['Electronics'] = ['Laptops', 'Cameras'];
    subCategories['Clothing'] = ['Dresses', 'Shirts'];
    subCategories['Phones'] = ['Smartphones', 'Accessories'];
    subCategories['Women'] = ['Smartphones', 'Accessories'];
    subCategories['Men'] = ['Smartphones', 'Accessories'];
    subCategories['Kids'] = ['Smartphones', 'Accessories'];
    subCategories['Home'] = ['Smartphones', 'Accessories'];

  }

  void fetchProductsForSubCategory(String subCategory) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // محاكاة تحميل البيانات

    // هنا يتم استبدال الكود لاسترجاع المنتجات من المصدر المناسب
    products[subCategory] = [
      // أضف المنتجات بناءً على الفئة الفرعية
      ProductModel(id: 1, name: 'Laptop', price: 1000, imageUrl: 'assets/images/laptop.png', ),
      ProductModel(id: 2, name: 'Smartphone', price: 800, imageUrl: 'assets/images/phone.png',),
    ];

    isLoading.value = false;
  }
}
