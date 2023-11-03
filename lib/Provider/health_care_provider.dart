import 'package:flutter/material.dart';
import '../Model/chat_message.dart';
import '../Model/open_ai.dart';
import '../service/answer.dart';

class HealthCareProvider extends ChangeNotifier {
  String _question = "";
  String _resultAI = "";
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _chatMessages = [];
  late GptData gptResponseData;

  String get question => _question;
  String get resultAI => _resultAI;
  TextEditingController get messageController => _messageController;
  List<ChatMessage> get chatMessages => _chatMessages;

  void addMessage(ChatMessage message) {
    _chatMessages.add(message);
    _messageController.clear();
    notifyListeners();
  }

  Future getRecomendations() async {
    final result = await RecommendationService.getSmartphoneRecommendations(
        question: _question);
    gptResponseData = result;
    _resultAI = gptResponseData.choices[0].text;
    _chatMessages
        .add(ChatMessage(messageContent: _resultAI, messageType: 'receiver'));
    notifyListeners();
  }

  set question(String question) {
    _question = question;
    notifyListeners();
  }

  set resultAI(String resultAI) {
    _resultAI = resultAI;
    notifyListeners();
  }
}
