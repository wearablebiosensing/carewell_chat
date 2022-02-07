// import 'package:flutter/material.dart';
// import 'package:chat_application/auth.dart';
// import 'package:chat_application/home_page.dart';
// import 'package:chat_application/login_page.dart';
// import 'package:chat_application/auth_provider.dart';

// class RootPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _RootPageState();
// }

// enum AuthStatus {
//   notDetermined,
//   notSignedIn,
//   signedIn,
// }

// class _RootPageState extends State<RootPage> {
//   AuthStatus authStatus = AuthStatus.notDetermined;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final BaseAuth auth = AuthProvider.of(context).auth;
//     auth.currentUser().then((String userId) {
//       setState(() {
//         authStatus =
//             userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
//       });
//     });
//   }

//   void _signedIn() {
//     setState(() {
//       authStatus = AuthStatus.signedIn;
//     });
//   }

//   void _signedOut() {
//     setState(() {
//       authStatus = AuthStatus.notSignedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (authStatus) {
//       case AuthStatus.notDetermined:
//         return _buildWaitingScreen();
//       case AuthStatus.notSignedIn:
//         return LoginPage(
//           onSignedIn: _signedIn,
//         );
//       case AuthStatus.signedIn:
//         return HomePage(
//           onSignedOut: _signedOut,
//         );
//     }
//   }

//   Widget _buildWaitingScreen() {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
