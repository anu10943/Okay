class Message {
  final String content;
  final String senderID;
  final String recipientID;
  final String time;
  final bool isGroup; // usage conditional upon requirement

  Message(
      {this.content, this.senderID, this.recipientID, this.time, this.isGroup});
}
