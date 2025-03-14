import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hi CAP students!"),),
        actions: [
          IconButton(onPressed: () {
            print("Search clicked!");
          }, icon: Icon(Icons.logout)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Hi this is your message!", style: TextStyle(fontSize: 20, color: Colors.white),),
                  Image.network("https://shorturl.at/PkTiO", height: 120),
                ],
              ),
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Hi this is your message!", style: TextStyle(fontSize: 20, color: Colors.white),),
                  Image.network("https://shorturl.at/PkTiO", height: 120),
                ],
              ),
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Hi this is your message!", style: TextStyle(fontSize: 20, color: Colors.white),),
                  Image.network("https://shorturl.at/PkTiO", height: 120),
                ],
              ),
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add), color: Colors.white,),
                IconButton(onPressed: (){}, icon: Icon(Icons.send), color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
