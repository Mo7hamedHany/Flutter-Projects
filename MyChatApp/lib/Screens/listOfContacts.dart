import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/constants.dart';

class ListOfContacts extends StatelessWidget {
  ListOfContacts({super.key});
  Icon? icon;

  final ScrollController _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  var auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> getUserData(String userId) async {
      try {
        DocumentSnapshot userSnapshot =
            await firestore.collection('users').doc(userId).get();

        if (userSnapshot.exists) {
          // User data exists, you can access it using userSnapshot.data()
          Map<String, dynamic> userData =
              userSnapshot.data() as Map<String, dynamic>;
          print('User Data: $userData');
        } else {
          // User data does not exist
          print('User not found');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }

    String? x = getUserData('BAyXyxrcGuTCo9RLxxZkqQsu0ze2').toString();
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            Text('Chat')
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
              ),
              GestureDetector(onTap: () {}, child: Text(x)),
            ],
          )
        ],
      ),
    );
  }
}
