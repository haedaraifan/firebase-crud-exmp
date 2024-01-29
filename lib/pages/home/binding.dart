import 'package:get/get.dart';
import 'package:firebase_crud_exmp/pages/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}