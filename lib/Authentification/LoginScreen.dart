import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUpScreen.dart';
import '../navigationBarBottom.dart';








class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding:  EdgeInsets.all(10),
                  child:  Text(
                    'Welcome to Workout',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding:  EdgeInsets.all(10),
                  child:  Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding:  EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child:  Text('Forgot Password',),
              ),
              Container(
                  height: 50,
                  padding:  EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child:  Text('Login'),
                    onPressed: () async {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBarBottom()));

                    },
                  )
              ),
              Row(
                children: <Widget>[
                   Text('Does not have account?'),
                  TextButton(
                    child:  Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
