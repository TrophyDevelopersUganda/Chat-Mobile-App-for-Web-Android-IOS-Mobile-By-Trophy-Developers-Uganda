
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fullchatside/widgets/chats/messages.dart';
import 'package:fullchatside/widgets/chats/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LulibApp Chat'),
        actions: [
        DropdownButton(
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
          icon: const Icon(Icons.more_vert_rounded),
          items: [
            DropdownMenuItem(
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout'),
          ],
        )
      ]),
      body: Container( margin:  EdgeInsets.only(top: 8),padding: EdgeInsets.all(9),
        child: Column(children:  const [
          Expanded(child: Messages()),
        NewMessage(),
        ],),
      ),
      //  StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/BXqBoKVm7fWW1qBNwfWq/messages')
      //       .snapshots(),
      //   builder: (context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) => Container(
      //         padding: const EdgeInsets.all(8),
      //         child: Text(snapshot.data?.docs[index]['text']),
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     FirebaseFirestore.instance
      //         .collection('chat/BXqBoKVm7fWW1qBNwfWq/messages')
      //         .add({'text': 'Newly Added by Mc Luliba'});
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
