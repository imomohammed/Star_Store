// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
//
// import '../Utils/app_references.dart';
// import '../Utils/class.dart';
// import '../Utils/function/handlingdatecontroller.dart';
// import '../Utils/routes.dart';
//
// abstract class  HomeController extends GetxController {
//   initialData()  ;
//   getdata() ;
//   goToItems(List categories, int selectedCat, String categoryid);
// }
// class HomeControllerImp extends HomeController {
//   AppPreferences appPreferences = Get.find();
//
//   String? username;
//   String? id;
//
//   //HomeData homedata = HomeData(Get.find());
//
//   // List data = [];
//   List categories = [];
//   List items = [];
//
//   late StatusRequest statusRequest;
//
//   @override
//   initialData() {
//
//     username = appPreferences.sharedPreferences.getString("username") ;
//     id = appPreferences.sharedPreferences.getString("id") ;
//   }
//
//   @override
//   void onInit() {
//     getdata();
//     initialData();
//     super.onInit();
//   }
//
//   @override
//   getdata(){ /*async {
//     statusRequest = StatusRequest.loading;
//     var response = await homedata.getData();
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         categories.addAll(response['categories']);
//         items.addAll(response['items']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();*/
//   }
//
//   @override
//   goToItems(category, selectedCat, categoryid) {
//     Get.toNamed(AppRoute.produsctdetail, arguments: {
//       "categories": category,
//       "selectedcat": selectedCat,
//       "catid": categoryid
//     });
//   }
// }