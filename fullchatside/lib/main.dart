import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullchatside/screens_chat/auth_screen.dart';
import 'package:fullchatside/screens_chat/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akaboozi ',
      theme: ThemeData(
        bottomAppBarColor: Colors.blueAccent,
        // primarySwatch: Colors.white70,
        scaffoldBackgroundColor: Colors.white,

        // backgroundColor: Colors.blueAccent,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return const ChatScreen();
            }
            return const AuthScreen();
          }),
      // const AuthScreen(),
    );
  }
}
