
import 'package:flutter/material.dart';
import 'package:hackathon_gc/ui/chat/chat_list_screen.dart';
import 'package:hackathon_gc/ui/chat/mentor_list_screen.dart';

import 'chat_screen.dart';
import 'chat_screen_mentor.dart';

class MainChatScreen extends StatefulWidget {
  @override
  _MainChatScreenState createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16.0,fontFamily: 'Family Name', fontWeight: FontWeight.w500),  //For Selected tab
              tabs: [
                Tab(text: 'Чаты'),
                Tab(text: 'Наставник'),
              ],
            ),
            title: Text('Сообщения'),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ChatListScreen(),
              PrivateChatScreenMentor(),
            ],
          ),
        ),
      ),
    );;
  }
}
