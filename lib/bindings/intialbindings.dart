import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../src/Utils/class/crud.dart';
//تُستخدم للتعامل مع العمليات المتعلقة بالبيانات (مثل الاتصال بقاعدة البيانات أو الـ API).
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud()) ;
  }
}