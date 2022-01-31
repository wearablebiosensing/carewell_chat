import 'package:chat_application/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:chat_application/widgets/widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameTextEditingController =
      new TextEditingController();

  TextEditingController emailTextEditingController =
      new TextEditingController();

  TextEditingController passwordTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //Make these all have controller: properties
              textField("username"),
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
                child: Text("Sign Up",
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
                child: Text("Sign Up with Google",
                    style: new TextStyle(color: Colors.black87, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  Text(
                    "Sign in now",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
