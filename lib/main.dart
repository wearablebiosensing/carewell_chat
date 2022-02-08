/*
import 'package:flutter/material.dart';
import 'package:chat_application/auth.dart';
import 'package:chat_application/auth_provider.dart';
import 'package:chat_application/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter login demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}

*/

//old main

import 'package:chat_application/services/auth_services.dart';
import 'package:chat_application/views/signin.dart';

import 'package:chat_application/views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:chat_application/views/chatRoomsScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<User?>();

//     if (user == null) {
//       return SignUp();
//     }
//     return ChatRoom();
//   }
// }

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     bool signedIn = false;

//     if (chatuser != null) {

//       print("signed in as: " + email);
//       return ChatRoom();
//     }
//     return SignUp();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //primaryColor: Color(0xff145C9E),
            primaryColor: Colors.blue[800],
            scaffoldBackgroundColor: Colors.blue[100],
            primarySwatch: Colors.blue,
          ),
          home: AuthWrapper(),
        ));

/*
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
    ); */
  }
}
