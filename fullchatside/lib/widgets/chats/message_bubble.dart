import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.isItMe, {Key? key, }) : super(key: key);
  final String message;
  final bool isItMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isItMe ? Colors.blueGrey: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(message,
              style: TextStyle(color: isItMe ? Colors.red : Theme.of(context).primaryColorLight)),
        ),
      ],
    );
  }
}
