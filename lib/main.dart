import 'package:chat_poc/Pages/MainPage.dart';
import 'package:chat_poc/models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ChatModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(
        category: "hostels",
      ),
    ),
  ));
}

// void main() {
//   runApp(ScopedModel<ChatModel>(
//     model: ChatModel(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(
//         category: "hostels",
//       ),
//     ),
//   ));
// }
