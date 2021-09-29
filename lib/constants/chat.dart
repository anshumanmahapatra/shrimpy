class ChatMessage {
  String messageContent;
  String messageType;
  String? time;
  String? showButton;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      this.time,
      this.showButton});
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "The Trader negotiated at Rs. 50,000 ",
      messageType: "receiver",
      time: "08 : 30 AM"),
  ChatMessage(
      messageContent: "You negotiated at Rs. 90,000",
      messageType: "sender",
      time: "08 : 47 AM"),
  ChatMessage(
      messageContent: "The Trader again negotiated at Rs. 60,000 ",
      messageType: "receiver",
      time: "09 : 10 AM"),
  ChatMessage(
    messageContent: "Do you want to negotiate or settle the deal ?",
    messageType: "sender",
    showButton: "yes",
  ),
  ChatMessage(
      messageContent: "Sorry, but no less than Rs. 90, 000",
      messageType: "sender",
      time: "09 : 30 AM"),
];
