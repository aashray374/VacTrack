import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;

  ChatScreen({super.key, required this.chatId});

  final TextEditingController messageController = TextEditingController();
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consultation")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _databaseReference
                    .child('chats/$chatId/messages')
                    .orderByChild('timestamp')
                    .onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
        
                  if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                    return const Center(child: Text("No messages yet"));
                  }
        
                  // Parse data from Firebase Realtime Database
                  Map<dynamic, dynamic> messagesMap = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  List<dynamic> messages = messagesMap.values.toList()..sort((a, b) => a['timestamp'].compareTo(b['timestamp']));
        
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      return ListTile(
                        title: Text(message['text']),
                        subtitle: Text(message['sender']),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(hintText: "Type a message"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      String displayName = FirebaseAuth.instance.currentUser!.displayName ?? "Unknown User";
        
                      _databaseReference
                          .child('chats/$chatId/messages')
                          .push()
                          .set({
                        'text': messageController.text,
                        'sender': displayName,
                        'senderId': userId,
                        'timestamp': DateTime.now().millisecondsSinceEpoch,
                      });
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
