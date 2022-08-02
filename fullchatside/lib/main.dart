import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullchatside/screens_chat/auth_screen.dart';
// import 'package:fullchatside/screens_chat/chat_screen.dart';

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
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Akaboozi ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}
// Future<void> main() async {
//   runApp( const MyApp());
  
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( debugShowCheckedModeBanner: false,
//       title: 'FlutterChat',
//       theme: ThemeData( 
//         // accentColorBrightness: Brightness.dark,
//       buttonTheme: ButtonTheme.of(context).copyWith(
//         buttonColor: Colors.purple,   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20, ))
//       ),
//         primarySwatch: Colors.blue,
//   secondaryHeaderColor:  Colors.purple,
//   backgroundColor:  Colors.blue,

//       ),
//       home:  const AuthScreen(),
      
//       // const ChatScreen(),
//     );
//   }
// }
