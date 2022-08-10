// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try{
       await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
        context: context, 
      builder: (context){
           return AlertDialog(
          content: Text('password reset link sent! check your email'),
          );
        }
      );
    } on FirebaseAuthException catch (e){
      showDialog(
        context: context, 
      builder: (context){
           return AlertDialog(
          content: Text(e.message.toString()),
          );
        }
      );
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text('Password Reset'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Enter your email and we will send you a password rest link',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        MaterialButton(
          onPressed: () => resetPassword(),
          child: Text(
            'Reset Password',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
          color: Colors.redAccent,
        )
      ]),
    );
  }
}
