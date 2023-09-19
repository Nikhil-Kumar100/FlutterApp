import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:techprohelpline/UI/Chat/socialmedia.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('messages');

  Future<void> _sendMessage(
      String text, List<Reply>? replies, bool isSender) async {
    await _messagesRef.push().set({
      'text': text,
      'timestamp': ServerValue.timestamp,
      'replies': replies?.map((reply) => reply.toJson()).toList(),
      'isSender': isSender,
    });
    _textController.clear();
  }

  Future<void> _uploadImage(File image, bool isSender) async {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => null);

    final String imageUrl = await storageReference.getDownloadURL();
    await _messagesRef.push().set({
      'image': imageUrl,
      'timestamp': ServerValue.timestamp,
      'isSender': isSender,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: AppColors.appbar,
        title: Text('Chat Page'),
        automaticallyImplyLeading: false, // Remove back button
        actions: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics:
                  AlwaysScrollableScrollPhysics(), // Enable horizontal scrolling
              child: SocialMedia(),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _messagesRef.orderByChild('timestamp').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final Map<dynamic, dynamic>? messages =
                        snapshot.data?.snapshot.value as Map?;
                    if (messages != null) {
                      final sortedMessages = messages.values.toList()
                        ..sort((a, b) => (a['timestamp'] ?? 0)
                            .compareTo(b['timestamp'] ?? 0));

                      return ListView.builder(
                        itemCount: sortedMessages.length,
                        itemBuilder: (context, index) {
                          final message = sortedMessages[index];
                          final isSender = message['isSender'] ?? false;

                          return ListTile(
                            title: message['text'] != null
                                ? Container(
                                    alignment: isSender
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Text(
                                      message['text'],
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  )
                                : null,
                            subtitle: Column(
                              crossAxisAlignment: isSender
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                if (message['image'] != null)
                                  Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    alignment: isSender
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Image.network(message['image']),
                                  ),
                                if (message['replies'] != null)
                                  for (final reply in message['replies'])
                                    Container(
                                      alignment: isSender
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Text('Reply: ${reply['text']}'),
                                    ),
                                Container(
                                  alignment: isSender
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Text(
                                    DateFormat('h:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        message['timestamp'] ?? 0,
                                      ),
                                    ),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 12, 168, 235)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () async {
                      final FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);
                      if (result != null && result.files.single.path != null) {
                        // _uploadImage(File(result.files.single.path!), true);
                      }
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Disabled', //'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        // _sendMessage(_textController.text, null, true);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reply {
  final String authorId;
  final String text;

  Reply({
    required this.authorId,
    required this.text,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      authorId: json['authorId'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authorId': authorId,
      'text': text,
    };
  }
}
