class ChatMessage {
  String? messageContent;
  String? messageType;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });

  Map<String,dynamic> toMap(){
    return{
      'content' : messageContent,
      'type' : messageType
    };
  }

  ChatMessage.fromMap(Map<String, dynamic> map){
    messageContent=map['content'];
    messageType=map['type'];
  }
}
