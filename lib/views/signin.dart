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
        // appBar: new AppBar(
        //   backgroundColor: Colors.blue[700],
        //   title: new Text("Carewell Chat"),
        // ),
        appBar: appBarMain(context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              textField("email"),
              textField("password"),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Forgot Password?",
                    style: new TextStyle(color: Colors.grey[700], fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        //blue color background
                        colors: [Color(0xff007EF4), Color(0xff2A75BC)]),
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Sign In",
                    style: new TextStyle(color: Colors.white70, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Sign In with Google",
                    style: new TextStyle(color: Colors.black87, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  Text(
                    "Register now",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

TextField textField(String text) {
  return TextField(
    decoration: InputDecoration(
        hintText: text, hintStyle: TextStyle(color: Colors.grey[500])),
  );
}
