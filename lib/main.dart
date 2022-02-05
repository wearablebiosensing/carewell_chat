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

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<User?>();

    // if (user == null) {
    //   return SignUp();
    // }
    // return ChatRoom();

    bool signedIn = false;

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     //signedIn = false;
    //     print('User is currently signed out!');
    //   } else {
    //     //signedIn = true;
    //     print('User is signed in!');
    //   }
    // });

    if (FirebaseAuth.instance.currentUser != null) {
      // wrong call in wrong place!
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => ChatRoom()));
    }

    if (!signedIn) {
      return SignUp();
    }
    return ChatRoom();
  }
}

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
