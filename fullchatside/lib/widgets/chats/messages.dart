import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fullchatside/widgets/chats/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User?> data() async {
      return FirebaseAuth.instance.currentUser;
    }

    return FutureBuilder(
        future: data(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext cxt, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              }
              final chatDocs = chatSnapshot.data?.docs;

              return ListView.builder(
                reverse: true,
                itemBuilder: ((cxt, index) => MessageBubble(
                      chatDocs![index]['text'],
                      chatDocs[index]['username'],
                      chatDocs[index]['userId'] == futureSnapshot.data,
                      key: ValueKey(chatDocs[index].id),
                    )),

                //  Text(chatDocs ![index]['text'])),
                physics: const BouncingScrollPhysics(),
                itemCount: chatDocs?.length,
              );
            },
          );
        });
  }
}

// class Messages extends StatelessWidget {
//   const Messages({Key? key}) : super(key: key);

//       Future<User?> userdata() async {
//               return FirebaseAuth.instance.currentUser;
//             }
//   @override
//   Widget build(BuildContext context) {
    
//     return FutureBuilder(
//       future: userdata(),
//       builder: (ctx, futureSnapshot) {
//         if (futureSnapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('chat')
//                 .orderBy(
//                   'createdAt',
//                   descending: true,
//                 )
//                 .snapshots(),
//             builder: (ctx, chatSnapshot) {
//               if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             //     Future<User?> data() async {
//             //   return FirebaseAuth.instance.currentUser;
//             // }


//    final chatDocs = (chatSnapshot as AsyncSnapshot<QuerySnapshot>).data!.docs;
//               return ListView.builder(
//               reverse: true,
//                             primary: false,
//                             shrinkWrap: true,
//                 itemCount: chatDocs.length,
//                 itemBuilder: (ctx, index) => MessageBubble(
//                   chatDocs[index]['text'],
//                   chatDocs[index]['UserId']   == futureSnapshot.data,
//                   key:  ValueKey(chatDocs[index].id),

//                 ),
//               );
//             });
//       },
//     );
//   }
// }
