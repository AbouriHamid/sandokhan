import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


import 'LoginScreen.dart';
import '../User_info.dart';
import '../navigationBarBottom.dart';









class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {



  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding:  EdgeInsets.all(10),
                  child:  Text(
                    'Welcome to Pro Men GYM',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding:  EdgeInsets.all(10),
                  child:  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding:  EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Full Name',
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: emailController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: confirmePasswordController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirme Password',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: 50,
                  padding:  EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child:  Text('Sign Up'),
                    onPressed: () async {

                      UserCredential userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                      String userId = userCredential.user!.uid;
                      final user_info = User_info(emailController.text, nameController.text, passwordController.text,"https://i.stack.imgur.com/l60Hf.png");
                      await FirebaseFirestore.instance.collection("users").doc(userId).set(user_info.toFirestore());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBarBottom()));

                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('have account?'),
                  TextButton(
                    child:  const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
