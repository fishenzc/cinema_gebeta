// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cinema_g/auth/auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // static late HomeController checkIfAlreadyLogin;

  // final box = GetStorage();

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      // Get.to(() => UserLogin());
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/netflix_logo0.png',
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                // ignore: prefer_const_literals_to_create_immutables
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Cinema ',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 3.0),
                  ),
                  TextSpan(
                    text: 'Gebeta',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 3.0),
                  )
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              // CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
