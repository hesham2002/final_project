import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../helper/assistant_provider.dart';

class ChatScreen extends StatelessWidget {
  final String patientId;

  ChatScreen({required this.patientId});

  @override
  Widget build(BuildContext context) {
    final assistantProvider = Provider.of<AssistantProvider>(context);
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat part'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: assistantProvider.getMessages(patientId).length,
              itemBuilder: (context, index) {
                final message = assistantProvider.getMessages(patientId)[index];
                return ListTile(
                  title: Align(
                    alignment: message.isAssistant
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message.isAssistant
                            ? Colors.blue[200]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(message.text),
                    ),
                  ),
                  subtitle: Align(
                    alignment: message.isAssistant
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      message.timestamp.toLocal().toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(thickness: 1,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    // Add your voice recording functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Add your file attachment functionality here
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      assistantProvider.addMessage(
                        patientId,
                        messageController.text,
                        true, // true indicating the message is from the assistant
                      );
                      messageController.clear();
                    }
                  },
                  child: Text('Send'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 30, 84), // Set the button color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
