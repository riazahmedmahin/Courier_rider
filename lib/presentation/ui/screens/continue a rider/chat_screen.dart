import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        icon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Chat(
              messages: _messages,
              onSendPressed: _handleSendPressed,
              onAttachmentPressed: _handleAttachmentPressed,
              user: _user,
              theme: DefaultChatTheme(
                primaryColor: AppColors.primaryColor,
                secondaryColor: Colors.greenAccent,
                backgroundColor: Colors.transparent,
                inputBackgroundColor: Colors.black,
                inputTextColor: Colors.black,
                receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                sentMessageBodyTextStyle: TextStyle(color: Colors.white),
              ),
              customBottomWidget: _buildCustomInput(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomInput() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo_camera, color: Colors.white),
                    onPressed: _handleAttachmentPressed,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      textInputAction: TextInputAction.send,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Type a message.....',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                      ),
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          _handleSendPressed(types.PartialText(text: value));
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      final text = _textController.text.trim();
                      if (text.isNotEmpty) {
                        _handleSendPressed(types.PartialText(text: text));
                        _textController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    if (message.text.trim().isEmpty) return;

    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.text,
    );

    _addMessage(textMessage);
    _textController.clear();
  }

  void _handleAttachmentPressed() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageMessage = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: pickedFile.name ?? '',
        size: File(pickedFile.path).lengthSync(),
        uri: pickedFile.path,
      );
      _addMessage(imageMessage);
    } else {
      // Handle the case when no image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
      print("Message added: ${message.toJson()}");
    });
  }
}
