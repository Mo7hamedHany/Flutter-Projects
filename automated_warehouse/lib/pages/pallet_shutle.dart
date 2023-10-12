import 'package:automated_warehouse/constants.dart';
import 'package:automated_warehouse/pages/Pallet%20Shuttle/control.dart';
import 'package:automated_warehouse/pages/Pallet%20Shuttle/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Pallet Shuttle/S_R.dart';

class PalletShuttle extends StatelessWidget {
  const PalletShuttle({super.key});

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
            'Pallet Shuttle',
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
                  return S_R(); //Navigate to the type of control screen (Wether move the pallet to store or to reterive)
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
