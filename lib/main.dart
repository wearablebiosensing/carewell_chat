import 'package:chat_application/views/signin.dart';
import 'package:chat_application/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Color(0xff145C9E),
        primaryColor: Colors.blue[800],
        scaffoldBackgroundColor: Colors.blue[100],
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}
