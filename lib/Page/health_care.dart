import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/chat_message.dart';
import '../Provider/health_care_provider.dart';

class HealthCarePage extends StatefulWidget {
  const HealthCarePage({super.key});

  @override
  State<HealthCarePage> createState() => _HealthCarePageState();
}

class _HealthCarePageState extends State<HealthCarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Health Care",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
      ),
      body: Stack(
        children: [
          Consumer<HealthCareProvider>(
            builder: (BuildContext context, healthCare, Widget? child) {
              return ListView.builder(
                itemCount: healthCare.chatMessages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 60),
                itemBuilder: (context, index) {
                  final messageType =
                      healthCare.chatMessages[index].messageType;
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Align(
                          alignment: (messageType == 'receiver'
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (messageType == 'receiver'
                                      ? const Color.fromARGB(255, 255, 189, 189)
                                      : const Color.fromARGB(
                                          255, 122, 186, 238))),
                              child: Text(
                                healthCare.chatMessages[index].messageContent ??
                                    "",
                                textAlign: TextAlign.justify,
                              )),
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              height: 60,
              width: double.infinity,
              color: const Color.fromARGB(255, 245, 235, 235),
              child: Consumer<HealthCareProvider>(
                builder: (BuildContext context, healthCare, Widget? child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: "How do you feel...",
                              border: InputBorder.none),
                          controller: healthCare.messageController,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          healthCare.question =
                              healthCare.messageController.text;
                          healthCare.addMessage(
                            ChatMessage(
                                messageContent:
                                    healthCare.messageController.text,
                                messageType: 'sender'),
                          );
                          try {
                            healthCare.getRecomendations();
                          } catch (e) {
                            print(e);
                          }
                        },
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          size: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
