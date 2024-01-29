import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_exmp/firebase_options.dart';
import 'package:firebase_crud_exmp/pages/create/binding.dart';
import 'package:firebase_crud_exmp/pages/create/create.dart';
import 'package:firebase_crud_exmp/pages/home/binding.dart';
import 'package:firebase_crud_exmp/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'firebase crud',
      initialRoute: "/home",
      getPages: [
          GetPage(name: "/home", page: () => const HomePage(), binding: HomeBinding()),
          GetPage(name: "/create", page: () => const CreatePage(), binding: CreateBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}