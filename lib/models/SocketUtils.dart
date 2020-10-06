import 'dart:convert';
import 'package:chat_poc/models/Examples.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import './User.dart';
import './Message.dart';

class SocketUtils {
  SocketIO socketIO;
  List<User> users = Examples.users;
  User currentUser;

  initSocket(User user) async {
    // this.currentUser = user;
    currentUser = user; // run as 1 2 3 in different devices
    print('CURRENT USER: ${currentUser.userID}');

    await init();
  }

  init() async {
    socketIO = SocketIOManager().createSocketIO(
        'https://calm-savannah-01592.herokuapp.com', '/',
        query: 'roomID=${currentUser.userID}');

    socketIO.init();
  }

  connectToSocket() {
    if (null == socketIO) {
      print("Socket is Null");
      return;
    }
    print("Connecting to socket...");
    socketIO.connect();
  }

  sendMessage(Message message) {
    if (null == socketIO) {
      print("Socket is Null, Cannot send message");
      return;
    }
    print('Send message $message to ${message.recipientID}');
    socketIO.sendMessage(
      'send_message',
      json.encode({
        'receiverChatID': message.recipientID,
        'senderChatID': message.senderID,
        'content': message.content,
        'time': message.time,
      }),
    );
  }

  setOnChatMessageReceivedListener(Function onChatMessageReceived) {
    socketIO.subscribe('receive_message', (data) {
      print("Received $data");
      onChatMessageReceived(data);
    });
  }

  closeConnection() {
    if (null != socketIO) {
      print("Close Connection");
      socketIO.disconnect();
    }
  }
}
