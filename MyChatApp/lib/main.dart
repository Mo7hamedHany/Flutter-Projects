import 'package:flutter/material.dart';
import 'package:mychatapp/Screens/chatPage.dart';
import 'package:mychatapp/Screens/listOfContacts.dart';
import 'package:mychatapp/Screens/loginScreen.dart';
import 'package:mychatapp/Screens/registerScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WhoChat());
}

class WhoChat extends StatelessWidget {
  const WhoChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'loginPage': (context) => loginScreen(),
        'registerPage': (context) => registerScreen(),
        'chatpage': (context) => ChatPage(),
        'ListOfContacts': (context) => ListOfContacts(),
      },
      home: loginScreen(),
    );
  }
}
