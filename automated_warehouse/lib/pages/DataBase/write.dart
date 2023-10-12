import 'package:automated_warehouse/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

String write_Text = 'Text goes here';
final database = FirebaseDatabase.instance.ref();

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  @override
  Widget build(BuildContext context) {
    // List of the Companies that our warehouse deals with
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/Pepsico");
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("users/El- Doha");
    DatabaseReference ref2 = FirebaseDatabase.instance.ref("users/El- Maleka");
    DatabaseReference ref3 = FirebaseDatabase.instance.ref("users/Faragallah");
    DatabaseReference ref4 = FirebaseDatabase.instance.ref("users/Covertina");
    DatabaseReference ref5 = FirebaseDatabase.instance.ref("users/Decathlon");
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
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                await ref.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Soda Cans",
                  "Pallet Number": "1",
                  "Cans Number": "99",
                  "address": "100 Mountain View",
                  "Shelf": "1",
                });
                print('done ya basha');
              },
              child: Text(
                'Pepsico', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                await ref1.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Rice",
                  "Packs Number": "1",
                  "kilos Number": "20",
                  "address": "Nasr City",
                  "Shelf": "2",
                });
                print('done ya basha');
              },
              child: Text(
                'El- Doha', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                DB = true;
                await ref2.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Spagetti",
                  "packs Number": "1",
                  "bag Number": " 99",
                  "address": "New cairo",
                  "Shelf": "3",
                });
                print('done ya basha');
              },
              child: Text(
                'El- Maleka', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                await ref3.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Jam",
                  "pallets Number": "1",
                  "Jam Jars": "99",
                  "address": "Alexandria",
                  "Shelf": "4",
                });
                print('done ya basha');
              },
              child: Text(
                'Faragallah', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                await ref4.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Chocolate",
                  "packs Number": "1",
                  "Chocolate bars": "99",
                  "address": "New cairo",
                  "Shelf": "5",
                });
                print('done ya basha');
              },
              child: Text(
                'Covertina', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //When clicking this Button the Following Data Automatically got stored in the Database
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              onPressed: () async {
                await ref5.set({
                  //Data to Be Stored related to this Company
                  "Item Name": "Shirts",
                  "packs Number": "1",
                  "Shirts Number": " 20",
                  "address": "Downtown",
                  "Shelf": "6",
                });
                print('done ya basha');
              },
              child: Text(
                'Decathlon', //Company Name
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
