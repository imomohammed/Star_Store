import 'package:get/get.dart';
import '../Model/produsct_model.dart';

class ProductsController extends GetxController {
  var categories = <String>[].obs; // قائمة الفئات الرئيسية
  var subCategories = <String, List<String>>{}.obs; // فئات فرعية لكل فئة رئيسية
  var products = <String, List<ProductModel>>{}.obs; // المنتجات لكل فئة فرعية
  var selectedSubCategory = ''.obs; // الفئة الفرعية المحددة
  var isLoading = false.obs;
  var isLoadingSubCategories = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // تحميل الفئات عند بدء تشغيل التطبيق
  }

  void fetchCategories() {
    // استرجاع الفئات الرئيسية من مصدر البيانات
    categories.assignAll(
        ['Electronics', 'Clothing', 'Phones', 'Women', 'Men', 'Kids', 'Home']);

    // استرجاع الفئات الفرعية لكل فئة رئيسية
    subCategories['Electronics'] = ['Laptops', 'Cameras'];
    subCategories['Clothing'] = ['Dresses', 'Shirts'];
    subCategories['Phones'] = ['Smartphones', 'Accessories'];
    subCategories['Women'] = ['Tops', 'Bottoms','T-Shirts','Jeans','Shirts','Toys','Decor'];
    subCategories['Men'] = ['T-Shirts', 'Jeans'];
    subCategories['Kids'] = ['Toys', 'Clothing'];
    subCategories['Home'] = ['Furniture', 'Decor'];
  }

  var subCategoryImages = {
    'Laptops': 'assets/images/lap1.png',
    'Cameras': 'assets/images/camera1.png',
    'Dresses': 'assets/images/girl.png',
    'Smartphones': 'assets/images/phon1.png',
    'Tops': 'assets/images/fash.png',
    'Toys': 'assets/images/fash.png',
  };

  void fetchProductsForSubCategory(String subCategory) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // محاكاة تحميل البيانات



    // هنا يتم استبدال الكود لاسترجاع المنتجات من المصدر المناسب
    List<ProductModel> fetchedProducts = [];

    // إضافة منتجات بناءً على الفئة الفرعية المحددة
    if (subCategory == 'Laptops' || subCategory == 'Electronics') {
      fetchedProducts = [
        ProductModel(
            id: 1,
            name: 'Laptop 1',
            price: 1000,
            imageUrl: 'assets/images/lap1.png'),
        ProductModel(
            id: 2,
            name: 'Laptop 2',
            price: 1500,
            imageUrl: 'assets/images/lap2.png'),
        ProductModel(
            id: 3,
            name: 'Camera 1',
            price: 500,
            imageUrl: 'assets/images/camera1.png'),
        ProductModel(
            id: 4,
            name: 'Camera 2',
            price: 800,
            imageUrl: 'assets/images/camera2.png'),
      ];
    } else if (subCategory == 'Phones') {
      fetchedProducts = [
        ProductModel(
            id: 3,
            name: 'Camera 1',
            price: 500,
            imageUrl: 'assets/images/phon1.png'),
        ProductModel(
            id: 4,
            name: 'Camera 2',
            price: 800,
            imageUrl: 'assets/images/phon2.png'),
      ];
    } else if (subCategory == 'Clothing') {
      fetchedProducts = [
        ProductModel(
            id: 5,
            name: 'Dress 1',
            price: 20,
            imageUrl: 'assets/images/girl.png'),
        ProductModel(
            id: 6,
            name: 'Shirts',
            price: 25,
            imageUrl: 'assets/images/girl2.png'),
      ];
    }
    // أضف المزيد من الحالات بناءً على الفئات الفرعية الأخرى...

    products[subCategory] = fetchedProducts;
    isLoading.value = false;
  }

  List<ProductModel> getProductsBySubCategory(String subCategory) {
    // Ensure that products are fetched before returning
    if (products[subCategory] == null || products[subCategory]!.isEmpty) {
      fetchProductsForSubCategory(subCategory);
    }
    return products[subCategory] ?? [];
  }
}

// //     products[subCategory] = [
// //       // أضف المنتجات بناءً على الفئة الفرعية
// //       ProductModel(id: 1, name: 'Laptop', price: 1000, imageUrl: 'assets/images/laptop.png', category: subCategory, description: 'A great laptop'),
// //       ProductModel(id: 2, name: 'Smartphone', price: 800, imageUrl: 'assets/images/phone.png', category: subCategory, description: 'A great smartphone'),
// //     ];
// //
// //     isLoading.value = false;
// //   }
// // }
// //   var categories = <String>[].obs; // قائمة الفئات
// //   var productsMap = <String, List<ProductModel>>{}.obs; // خريطة لتخزين المنتجات لكل فئة
// //   var isLoading = false.obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchCategories();
// //     fetchProductsForCategory(categories[0]); // جلب المنتجات للفئة الأولى عند بدء التشغيل
// //   }
// //
// //   void fetchCategories() {
// //     // استرجاع الفئات من مصدر البيانات وتحديث القائمة
// //     categories.assignAll(['Electronics', 'Clothing', 'Phones', 'Women', 'Men', 'Home', 'Kids']);
// //   }
// //
// //   void fetchProductsForCategory(String category) async {
// //     // تحقق مما إذا كانت البيانات قد تم تحميلها مسبقًا
// //     if (productsMap[category] != null) return;
// //
// //     isLoading.value = true;
// //
// //     // هنا يتم استبدال الكود لاسترجاع المنتجات من المصدر المناسب
// //     await Future.delayed(Duration(seconds: 2)); // محاكاة تحميل البيانات
// //
// //     // المنتجات المسترجعة للفئة المحددة
// //     List<ProductModel> fetchedProducts = [
// //       // إضافة منتجات للتجربة
// //       if (category == 'Electronics')
// //         ...[
// //           ProductModel(id: 1, name: 'Laptop', price: 1000, imageUrl: 'assets/images/lap1.png', category: 'Electronics', description: 'Electronics'),
// //           ProductModel(id: 2, name: 'Laptop', price: 1500, imageUrl: 'assets/images/lap2.png', category: 'Electronics', description: 'Electronics'),
// //         ],
// //       if (category == 'Clothing')
// //         ...[
// //           ProductModel(id: 3, name: 'Dress', price: 20, imageUrl: 'assets/images/girl.png', category: 'Clothing', description: 'Clothing'),
// //           ProductModel(id: 4, name: 'Shirt', price: 50, imageUrl: 'assets/images/girl2.png', category: 'Clothing', description: 'Clothing'),
// //         ],
// //       if (category == 'Phones')
// //         ...[
// //           ProductModel(id: 5, name: 'Phone', price: 1500, imageUrl: 'assets/images/phon2.png', category: 'Phones', description: 'Electronics'),
// //           ProductModel(id: 6, name: 'Phone', price: 1200, imageUrl: 'assets/images/phon1.png', category: 'Phones', description: 'Electronics'),
// //         ],
// //       // يمكنك إضافة المزيد من المنتجات حسب الفئات الأخرى
// //     ];
// //
// //     productsMap[category] = fetchedProducts;
// //     isLoading.value = false;
// //   }
// //
// //   List<ProductModel> getProductsByCategory(String category) {
// //     return productsMap[category] ?? [];
// //   }
// // }
//
//
//
//
//
//
//
// import 'package:get/get.dart';
//
// import '../Model/produsct_model.dart';
//
// class ProductsController extends GetxController {
//   var isLoading = false.obs;
//   var isLoadingSubCategories = false.obs;
//   var categories = <String>[].obs;
//   var subCategories = {}.obs;
//   var products = {}.obs;
//
//   void fetchCategories() async {
//     isLoading(true);
//     // Fetch categories logic here
//     isLoading(false);
//   }
//
//   void fetchSubCategories(String category) async {
//     isLoading(true);
//     // Fetch subcategories logic here
//     subCategories[category] = await getSubCategoriesFromApi(category);
//     isLoading(false);
//   }
//
//   Future<List<String>> getSubCategoriesFromApi(String category) async {
//     // Simulate API call delay
//     await Future.delayed(Duration(seconds: 2));
//     return ['SubCat1', 'SubCat2', 'SubCat3']; // Replace with actual API call
//   }
//
//   // Update the return type to List instead of void
//   List<ProductModel> getProductsBySubCategory(String subCategory) {
//     return products[subCategory] ?? [];
//   }
//
//   void fetchProductsForSubCategory(String subCategory) async {
//     isLoading(true);
//     // Simulate fetching products logic here
//     products[subCategory] = await getProductsFromApi(subCategory);
//     isLoading(false);
//   }
//
//   Future<List<ProductModel>> getProductsFromApi(String subCategory) async {
//     // Simulate API call delay
//     await Future.delayed(Duration(seconds: 2));
//     return [
//       ProductModel(id: 1, name: 'Product 1', price: 100, imageUrl: 'assets/images/lap1.png'),
//       ProductModel(id: 2, name: 'Product 2', price: 200, imageUrl: 'assets/images/lap2.png'),
//     ]; // Replace with actual API call
//   }
// }
