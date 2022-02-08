import 'package:chat_application/views/chatRoomsScreen.dart';
import 'package:chat_application/views/search.dart';
import 'package:chat_application/views/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_application/widgets/widget.dart';
import 'package:chat_application/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

class DataBaseMethods {
  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get(); //Not sure if this is right
  }

  uploadUserInfo(userMap) {
    //Adds user's data to Firebase w/ their email
    FirebaseFirestore.instance.collection("users").add(userMap);
    //Only storing the email as the username. In the future we can customize this to have
    //the user create a username
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
