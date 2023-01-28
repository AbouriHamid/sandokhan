
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'Authentification/LoginScreen.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.orange),
    home: LoginScreen(),
  ));
}
