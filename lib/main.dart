import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/viewmodel/add_to_bookmark_controller.dart';
import 'package:latihan_erico/view/SpalshScreen/splash_screen_1.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: 'AIzaSyDjwYpcg3MYeS70Z8mUUmPqFlIn-Im-Ewc',
    appId: '1:434666292313:android:ee029d06aa0f064db79d48',
    projectId: 'latihan-erico',
    messagingSenderId: '434666292313',
    // Tambahkan opsi lain jika diperlukan
  );

  try {
    await Firebase.initializeApp(options: firebaseOptions);
  } catch (e) {
    // Handle the error here
    print('Error initializing Firebase: $e');
  }

  await Firebase.initializeApp(options: firebaseOptions);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen1(),
      // Menambahkan binding untuk view model
      initialBinding: BindingsBuilder(() {
        Get.put(AddToBookmarkViewModel());
      }),
    );
  }
}
