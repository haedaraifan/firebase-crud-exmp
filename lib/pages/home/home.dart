import 'package:firebase_crud_exmp/models/todo_model.dart';
import 'package:firebase_crud_exmp/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addTodo,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "firebase crud",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea( 
        child: Obx(
          () => controller.isLoading.value
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : ListView.separated(
            shrinkWrap: true,
            itemCount: controller.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              TodoModel todo = controller.todoList[index];
              return ListTile(
                title: Text(todo.title!),
                subtitle: Text(todo.content!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => controller.updateTodo(todo),
                      child: Icon(Icons.edit),
                    ),
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () => controller.deleteTodo(todo.id!),
                      child: Icon(Icons.delete),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            }
          ),
        )
      ),
    );
  }
}