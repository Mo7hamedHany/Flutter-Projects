import 'package:automated_warehouse/constants.dart';
import 'package:automated_warehouse/pages/Forklift/control.dart';
import 'package:automated_warehouse/pages/Forklift/gallery.dart';
import 'package:automated_warehouse/pages/Forklift/movements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Forklift extends StatelessWidget {
  const Forklift({super.key});

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
            'Forklift',
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
                  return Movements(); //Navigate to the control Screen
                }));
              },
              child: Text(
                '  Control Unit ',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
