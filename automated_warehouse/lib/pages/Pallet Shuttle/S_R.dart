import 'package:automated_warehouse/constants.dart';
import 'package:automated_warehouse/pages/Pallet%20Shuttle/Reterive.dart';
import 'package:automated_warehouse/pages/Pallet%20Shuttle/control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class S_R extends StatelessWidget {
  const S_R({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Store & Retrive Units',
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
                  return ControlUnit();
                }));
              },
              child: Text(
                '  Store a Unit ',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Reterive();
                }));
              },
              child: Text(
                '  Reterive a Unit ',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
