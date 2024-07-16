// import 'package:firebase_production_app/controller/homecontroller.dart';
// import 'package:firebase_production_app/pages/homepage.dart';
import 'package:firebase_production_app/controller/homecontroller.dart';
import 'package:firebase_production_app/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCMET2Z34EPI7euU62kGBOpjxsAq6aVjLw",
            authDomain: "fir-productionapp.firebaseapp.com",
            projectId: "fir-productionapp",
            storageBucket: "fir-productionapp.appspot.com",
            messagingSenderId: "690507808482",
            appId: "1:690507808482:web:43e3d7eef50921f0e3a8bb",
            measurementId: "G-5S8J8X889G"));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCb0Nd6U1NLa5iSvL3WMeoxGzCxYcHpi9c",
            appId: "1:690507808482:android:7d56f0dd28ca8c10e3a8bb",
            messagingSenderId: "690507808482",
            projectId: "fir-productionapp"));
  }
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
