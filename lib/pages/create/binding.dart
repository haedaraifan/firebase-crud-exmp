import 'package:firebase_crud_exmp/pages/create/controller.dart';
import 'package:get/get.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}