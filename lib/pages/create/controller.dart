import 'package:firebase_crud_exmp/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TodoModel? oldTodo;

  @override
  void onInit() {
    super.onInit();
    oldTodo = Get.arguments as TodoModel?;
    if(oldTodo != null) {
      titleController.text = oldTodo!.title!;
      contentController.text = oldTodo!.content!;
    }
  }

  void onSubmit() {
    if(titleController.text.trim().isNotEmpty && contentController.text.trim().isNotEmpty) {
      Get.back(
        result: TodoModel(
          id: oldTodo?.id,
          title: titleController.text,
          content: contentController.text
        )
      );
    }
  }
}