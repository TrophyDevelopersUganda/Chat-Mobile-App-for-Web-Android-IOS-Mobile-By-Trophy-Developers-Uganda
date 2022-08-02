import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
  
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/BXqBoKVm7fWW1qBNwfWq/messages')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
 
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: Text(snapshot.data?.docs[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/BXqBoKVm7fWW1qBNwfWq/messages')
              .add({'text': 'Newly Added by Mc Luliba' });
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}
