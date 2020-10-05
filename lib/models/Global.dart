import 'package:chat_poc/models/Examples.dart';

import 'User.dart';
import 'SocketUtils.dart';

class Global {
  // Socket
  static SocketUtils socketUtils;
  static List<User> dummyUsers;

  // Logged In User
  static User loggedInUser;

  // Single Chat - To Chat User
  static User toChatUser;

  static initSocket() {
    if (null == socketUtils) {
      socketUtils = SocketUtils();
    }
  }

  static void initDummyUsers() {
    dummyUsers = List<User>();
    dummyUsers = Examples.users;
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}
