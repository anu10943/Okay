import 'dart:convert';

import 'package:chat_poc/models/Examples.dart';
import 'package:chat_poc/models/Group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:intl/intl.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

import './User.dart';
import './Message.dart';

class ChatModel extends ChangeNotifier {
  // IO.Socket socket;
  SocketIO socketIO;

  List<User> users = Examples.users;

  User currentUser;
  List<User> contacts = List<User>();

  // List<Message> messages = List<Message>();
  List<Message> messages = Examples.messages;

  Group group = Examples.group;

  int getMessages() => messages.length;

  void appendMessages(
      {String text, String recipientID, String senderID, String time}) {
    messages.add(Message(
      content: text,
      senderID: senderID,
      recipientID: recipientID,
      time: time,
    ));

    print('LATEST MESSAGE: ${messages[messages.length - 1].content}');
    notifyListeners();
  }

  void init() {
    currentUser = users[1]; // run as 1 2 3 in different devices

    print('CURRENT USER: ${currentUser.userID}');

    socketIO = SocketIOManager().createSocketIO(
        'https://calm-savannah-01592.herokuapp.com', '/',
        query: 'roomID=${currentUser.userID}');

    socketIO.init();

    socketIO.subscribe('receive_message', (jsonData) {
      // Map<String, dynamic> data = json.decode(jsonData);
      print(jsonData);
      // messages.add(Message(
      //   content: data["content"],
      //   senderID: data["senderChatID"],
      //   recipientID: data["receiverChatID"],
      //   time: DateFormat.jm().format(DateTime.now()),
      // ));
      print(messages.length);
      notifyListeners();
    });

    socketIO.connect();
  }

  void sendMessage(String text, String recipientID) {
    // messages.add(Message(
    //   content: text,
    //   senderID: currentUser.userID,
    //   recipientID: recipientID,
    //   isGroup: false, //individual message change  to true when testng for group
    //   time: DateFormat.jm().format(DateTime.now()),
    // ));

    socketIO.sendMessage(
      'send_message',
      json.encode({
        'receiverChatID': recipientID,
        'senderChatID': currentUser.userID,
        'content': text,
        'time': DateFormat.jm().format(DateTime.now()),
        // 'isGroup':
        //     false, //individual message change  to true when testng for group
      }),
    );
    print(messages.length);
    appendMessages(
      text: text,
      senderID: currentUser.userID,
      recipientID: recipientID,
      time: DateFormat.jm().format(DateTime.now()),
    );
    // notifyListeners();
  }

  List<Message> getMessagesForID(String chatID) {
    return messages
        .where((msg) =>
            msg.isGroup == false && //individual
            (msg.senderID == chatID || msg.recipientID == chatID))
        .toList();
  }
}

// class ChatModel extends Model {
//   // IO.Socket socket;
//   SocketIO socketIO;

//   List<User> users = Examples.users;

//   User currentUser;
//   List<User> contacts = List<User>();

//   // List<Message> messages = List<Message>();
//   List<Message> messages = Examples.messages;

//   Group group = Examples.group;

//   static ChatModel of(BuildContext context) =>
//       ScopedModel.of<ChatModel>(context, rebuildOnChange: true);

//   void init() {
//     currentUser = users[1]; // run as 1 2 3 in different devices

//     print('CURRENT USER: ${currentUser.userID}');

//     // contacts =
//     //     users.where((user) => user.userID != currentUser.userID).toList();

//     // socket =
//     //     IO.io('https://calm-savannah-01592.herokuapp.com', <String, dynamic>{
//     //   'transports': ['websocket'],
//     //   'query': 'roomID=${currentUser.userID}'),
//     // });

//     socketIO = SocketIOManager().createSocketIO(
//         'https://calm-savannah-01592.herokuapp.com', '/',
//         query: 'roomID=${currentUser.userID}');

//     socketIO.init();

//     // socket.on("receive_message", (response) {
//     //   Map<String, dynamic> data = json.decode(response);
//     //   messages.add(Message(
//     //     content: data["content"],
//     //     senderID: data["senderChatID"],
//     //     recipientID: data["receiverChatID"],
//     //     time: DateFormat.jm().format(DateTime.now()),
//     //   ));

//     // notifyListeners();
//     // });

//     socketIO.subscribe('receive_message', (jsonData) {
//       Map<String, dynamic> data = json.decode(jsonData);
//       print(data);
//       messages.add(Message(
//         content: data["content"],
//         senderID: data["senderChatID"],
//         recipientID: data["receiverChatID"],
//         time: DateFormat.jm().format(DateTime.now()),
//       ));
//       print(messages);

//       notifyListeners();
//     });

//     // socket.connect();
//     socketIO.connect();

//     // socket.on('connect', (data) {
//     //   print("Connection Initiated: $data");
//     // });
//   }

//   void sendMessage(String text, String recipientID) {
//     messages.add(Message(
//       content: text,
//       senderID: currentUser.userID,
//       recipientID: recipientID,
//       isGroup: false, //individual message change  to true when testng for group
//       time: DateFormat.jm().format(DateTime.now()),
//     ));

//     // socket.emit(
//     //     "send_message",
//     //     json.encode({
//     //       'receiverChatID': recipientID,
//     //       'senderChatID': currentUser.userID,
//     //       'content': text,
//     //       'time': DateFormat.jm().format(DateTime.now()),
//     //     }));

//     socketIO.sendMessage(
//       'send_message',
//       json.encode({
//         'receiverChatID': recipientID,
//         'senderChatID': currentUser.userID,
//         'content': text,
//         'time': DateFormat.jm().format(DateTime.now()),
//         'isGroup':
//             false, //individual message change  to true when testng for group
//       }),
//     );

//     notifyListeners();
//   }

//   List<Message> getMessagesForID(String chatID) {
//     return messages
//         .where((msg) =>
//             msg.isGroup == false && //individual
//             (msg.senderID == chatID || msg.recipientID == chatID))
//         .toList();
//   }
// }
