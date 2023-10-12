import 'package:automated_warehouse/constants.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Read extends StatefulWidget {
  String? DisplayText = 'results go here';
  final database = FirebaseDatabase.instance.ref();

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    //List of Companies which the displayed data are related to
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/El- Doha");
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("users/Pepsico");
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
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      margin: EdgeInsets.only(top: 10, right: 10),
                      width: 280,
                      height: 212,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1.0)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pepsico',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: FirebaseAnimatedList(
                              query: ref1,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 1.0)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 9),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.key!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.child('name').value.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          // Change the font
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*   Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(top: 10),
                      width: 160,
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  10), // add some empty space for better look
                          Text(
                            'Pepsico',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: FirebaseAnimatedList(
                              query: ref1,
                              itemBuilder:
                                  (context, snapshot, animation, index) {
                                return ListTile(
                                  title: Text(
                                      snapshot.child('name').value.toString()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ), */
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width: 280,
                  height: 212,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EL-Doha',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: ref,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width:
                                            1.0)), // Add a border to each row
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.key!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black, // Change the font
                                    ),
                                  ),
                                  Text(
                                    snapshot.child('name').value.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Change the font
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Change the background color
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey, width: 1.0), // Add a border
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width:
                      280, // Increase the width of the container to fit the column headings
                  height: 212, // Increase the height to fit more data
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width:
                                      1.0)), // Add a border to the heading row
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EL-Maleka',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // Change the font
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: ref2,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width:
                                            1.0)), // Add a border to each row
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.key!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black, // Change the font
                                    ),
                                  ),
                                  Text(
                                    snapshot.child('name').value.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Change the font
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Change the background color
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey, width: 1.0), // Add a border
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width:
                      280, // Increase the width of the container to fit the column headings
                  height: 212, // Increase the height to fit more data
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width:
                                      1.0)), // Add a border to the heading row
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Faragallah',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // Change the font
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: ref3,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width:
                                            1.0)), // Add a border to each row
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.key!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black, // Change the font
                                    ),
                                  ),
                                  Text(
                                    snapshot.child('name').value.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Change the font
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Change the background color
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey, width: 1.0), // Add a border
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width:
                      280, // Increase the width of the container to fit the column headings
                  height: 212, // Increase the height to fit more data
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width:
                                      1.0)), // Add a border to the heading row
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Covertina',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // Change the font
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: ref4,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width:
                                            1.0)), // Add a border to each row
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.key!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black, // Change the font
                                    ),
                                  ),
                                  Text(
                                    snapshot.child('name').value.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Change the font
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Change the background color
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey, width: 1.0), // Add a border
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width:
                      280, // Increase the width of the container to fit the column headings
                  height: 212, // Increase the height to fit more data
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width:
                                      1.0)), // Add a border to the heading row
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Decathlon',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                // Change the font
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: ref5,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black,
                                        width:
                                            1.0)), // Add a border to each row
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.key!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black, // Change the font
                                    ),
                                  ),
                                  Text(
                                    snapshot.child('name').value.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Change the font
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
