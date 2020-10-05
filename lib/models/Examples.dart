import 'package:chat_poc/models/User.dart';
import 'package:chat_poc/models/Message.dart';
import 'package:chat_poc/models/Group.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Examples {
  static List<User> users = [
    User(name: "Mac", userID: "1001"),
    User(name: "Kira", userID: "2002"),
    User(name: "Jason", userID: "3003"),
    User(name: "Selene", userID: "4004"),
    User(name: "Shawn", userID: "5005"),
    User(name: "Burton", userID: "6006"),
    User(name: "Alexis", userID: "7007"),
  ];

  static List<Message> messages = [
    Message(
      content: 'Hello',
      senderID: '1001',
      recipientID: '2002',
      isGroup: false,
      time: DateFormat.jm().format(DateTime.now()),
    ),
    Message(
      content: 'World',
      senderID: '2002',
      recipientID: '1001',
      isGroup: false,
      time: DateFormat.jm().format(DateTime.now()),
    ),
    Message(
      content: 'Today',
      senderID: '1001',
      recipientID: '2002',
      isGroup: false,
      time: DateFormat.jm().format(DateTime.now()),
    ),
    Message(
      content: 'Is a',
      senderID: '2002',
      recipientID: '999',
      isGroup: true,
      time: DateFormat.jm().format(DateTime.now()),
    ),
    Message(
      content: 'Beautiful',
      senderID: '3003',
      recipientID: '999',
      isGroup: true,
      time: DateFormat.jm().format(DateTime.now()),
    ),
    Message(
      content: 'Day',
      senderID: '7007',
      recipientID: '999',
      isGroup: true,
      time: DateFormat.jm().format(DateTime.now()),
    ),
  ];

  static Group group = Group(name: 'Hostels', groupID: '999', members: [
    User(name: "Mac", userID: "1001"),
    User(name: "Kira", userID: "2002"),
    User(name: "Jason", userID: "3003"),
    User(name: "Selene", userID: "4004"),
    User(name: "Shawn", userID: "5005"),
    User(name: "Burton", userID: "6006"),
    User(name: "Alexis", userID: "7007"),
  ]);

  static List<Tab> myTabs = [
    Tab(text: 'Sub-Collabs'),
    Tab(text: 'Messages'),
    Tab(text: 'Plugins'),
  ];

  static var directory = {
    "hostels": {
      "title": 'Hostels',
      "subtitle": 'in "MIT Boston"',
    },
    "a_hostel": {
      "title": 'A Hostel',
      "subtitle": 'in "Hostels"',
    },
    "b_hostel": {
      "title": 'B Hostel',
      "subtitle": 'in "Hostels"',
    },
    "c_hostel": {
      "title": 'C Hostel',
      "subtitle": 'in "Hostels"',
    },
    "a_hostel_first_floor": {
      "title": 'First Floor',
      "subtitle": 'in "A Hostel"',
    },
    "a_hostel_second_floor": {
      "title": 'Second Floor',
      "subtitle": 'in "A Hostel"',
    },
  };

  static var subcollabs = {
    "hostels": [
      "a_hostel",
      "b_hostel",
      "c_hostel",
    ],
    "a_hostel": [
      "a_hostel_first_floor",
      "a_hostel_second_floor",
    ],
  };
}
