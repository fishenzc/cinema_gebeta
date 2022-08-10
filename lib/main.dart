// ignore_for_file: prefer_const_constructors

import 'package:cinema_g/screens/screens.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCs98L2aFc-OT5KPlHnhTc7zH0LrtOcFXs ',
      appId: '1:662986730777:android:895b6a3f2584fa4ceee988',
      messagingSenderId: '662986730777',
      projectId: 'cinema-gebeta',
      authDomain: 'cinema-gebeta.firebaseapp.com',
      databaseURL: 'https://cinema-gebeta.firebaseio.com',
      storageBucket: 'cinema-gebeta.appspot.com',
      measurementId: '',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Gebeta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(),
      // UserLogin(),
    );
  }
}
