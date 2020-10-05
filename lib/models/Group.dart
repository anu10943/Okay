import 'package:chat_poc/models/User.dart';

class Group {
  final String name;
  final String groupID;
  final List<User> members;

  Group({this.name, this.groupID, this.members});
}
