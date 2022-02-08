import 'package:chat_application/views/chatRoomsScreen.dart';
import 'package:chat_application/views/constants.dart';
import 'package:chat_application/views/conversation_screen.dart';
import 'package:chat_application/views/dataBaseMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();

  late QuerySnapshot searchSnapshot;

  void initiateSearch() {
    //For whatever reason these functions dont return the list view
    dataBaseMethods
        .getUserByEmail(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
        print(searchSnapshot.docs[0].data().toString());
      });
    });
    createChatRoomAndStartConversation(
        searchSnapshot.docs[0].data().toString());
  }

  createChatRoomAndStartConversation(String userName) {
    String chatRoomId = getChatRoomId(userName, Constants.myName);

    List<String> users = [
      userName,
      Constants.myName
    ]; //Use shared preference to save username so it can be used in here

    //Next we need a map to create the chat rooms
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatroomId": chatRoomId
    };

    dataBaseMethods.createChatRoom(chatRoomId, chatRoomMap);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationScreen()));
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTile(
                  //BELOW MIGHT BE WRONG
                  userEmail: searchSnapshot.docs[0].data().toString());
            })
        : Container();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Search username...",
                        hintStyle: TextStyle(
                          color: Colors.white38,
                        ),
                        border: InputBorder.none),
                  )),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.white38,
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.search)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  //SearchTile({ Key? key, required this.userEmail }) : super(key: key);

  final String userEmail;

  SearchTile({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userEmail),
            ],
          ),
          Spacer(),
          Container(
            decoration: new BoxDecoration(color: Colors.green),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message"),
          ),
        ],
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
