import 'package:chat_application/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var context2 = context;
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Carewell Chat"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.white54)),
              ),
            ],
          ),
        ));
  }
}

TextField textField(String text) {
  return TextField(
    decoration: InputDecoration(
        hintText: text, hintStyle: TextStyle(color: Colors.white54)),
  );
}
