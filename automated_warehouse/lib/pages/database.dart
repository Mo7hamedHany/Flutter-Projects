import 'package:automated_warehouse/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'DataBase/read.dart';
import 'DataBase/write.dart';

final database = FirebaseDatabase.instance.ref();

class DataBase extends StatefulWidget {
  const DataBase({super.key});

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
    void store() async {
      await ref.set({
        "name": "John",
        "age": 18,
        "address": {"line1": "100 Mountain View"}
      });
    }

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.search))
          ],
          title: Text(
            'DataBase',
          )),
      backgroundColor: Color(primarycolorr),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Write(); //Navigate to the Screen where we Add data from
                }));
              },
              child: Text(
                '  Add Data ',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Read(); //Navigate to the Screen where we display data in
                }));
              },
              child: Text(
                '  Retrive Data ',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),

            /*
            ElevatedButton(
              onPressed: () async {
                await ref.set({
                  "name": "John",
                  "age": 18,
                  "inventory": 99,
                  "address": {"line1": "100 Mountain View"}
                });
                print('done ya basha');
              },
              child: Text('simple text'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.update({
                  'name': 'Jack',
                });
                print('done ya kber');
              },
              child: Text('update'),
            )
         */
          ],
        ),
      ),
    );
  }
}
