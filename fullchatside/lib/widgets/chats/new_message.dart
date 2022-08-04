import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'birthoftext': Timestamp.now(),
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(  
      children: [  
       Expanded(
         child: TextField(
           controller: _controller,
           decoration: const InputDecoration(labelText: 'Send A Messege...'),
           onChanged: (value) {
             setState(() {
               _enteredMessage = value;
             });
           },
         ),
       ),
        
        IconButton(
          color: Colors.green,
          onPressed: _enteredMessage.trim().isEmpty
              ? null
              : () {
                  _sendMessage();
                },
          icon: const Icon(Icons.send),
        )
      ],
    );
  }
}
