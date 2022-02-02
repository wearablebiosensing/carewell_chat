import 'package:chat_application/views/chatRoomsScreen.dart';
import 'package:chat_application/views/signin.dart';
import 'package:chat_application/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: ChatRoom(),
    );
  }
}
