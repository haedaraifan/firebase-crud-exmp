import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_exmp/models/todo_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  final uid = const Uuid();
  final db = FirebaseFirestore.instance;
  RxList<TodoModel> todoList = RxList<TodoModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodo();
  }

  void addTodo() async {
    isLoading.value = true;
    var newTodo = await Get.toNamed("/create");
    newTodo = newTodo as TodoModel?;

    if (newTodo != null) {
      newTodo.id = uid.v4();
      await db.collection("todo").doc(newTodo.id).set(newTodo.toJson());
    }

    getTodo();
  }

  void getTodo() async {
    isLoading.value = true;
    todoList.clear();

    await db.collection("todo").get().then((allTodo) {
      for (var todo in allTodo.docs) {
        todoList.add(
          TodoModel.fromJson(todo.data())
        );
      }
    });

    isLoading.value = false;
  }

  void updateTodo(TodoModel oldTodo) async {
    isLoading.value = true;
    var newTodo = await Get.toNamed("/create", arguments: oldTodo);
    newTodo = newTodo as TodoModel?;

    if(newTodo != null) {
      await db.collection("todo").doc(oldTodo.id).set(newTodo.toJson());
    }

    getTodo();
    Get.back();
  }

  void deleteTodo(String id) async {
    isLoading.value = true;
    await db.collection("todo").doc(id).delete();
    getTodo();
  }
}