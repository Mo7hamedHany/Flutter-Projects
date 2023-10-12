import 'package:automated_warehouse/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'bluetooth/bluetooth.dart';
import 'screens/set_device.dart';
import 'package:provider/provider.dart';

class Storee extends StatefulWidget {
  const Storee({super.key});

  @override
  State<Storee> createState() => _StoreeState();
}

class _StoreeState extends State<Storee> {
  late Bluetooth bluetooth;
  String? number;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool _isButtonUnavailable = false;

  @override
  void initState() {
    super.initState();
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: false);
    // Listen for further state changes
    bluetooth.bluetoothSerial.onStateChanged().listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
        print(state.isEnabled);
        if (_bluetoothState == BluetoothState.STATE_OFF) {
          _isButtonUnavailable = true;
        }
      });
    });
  }

  @override
  void dispose() {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: false);
    if (bluetooth.connection != null) {
      bluetooth.connection!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(primarycolorr),
        appBar: AppBar(title: Text('Send a Unit')),
        body: SafeArea(
          child: StreamBuilder<BluetoothState>(
              stream: bluetooth.bluetoothSerial.onStateChanged(),
              builder: (context, snapshot) {
                if (snapshot.data != null &&
                    snapshot.data! == BluetoothState.STATE_ON) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            right: 100, left: 100, top: 10, bottom: 10),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(
                          number ??
                              '', // Display the pressed number or an empty string
                          style: TextStyle(
                            color: Color(0xFFEAC168),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              setState(() {
                                number = '1';
                                print('nada');
                                if (bluetooth.connection != null) {
                                  try {
                                    bluetooth.connection!.output
                                        .add(bluetooth.encodeMessage('1'));
                                  } catch (e) {
                                    if (e
                                        .toString()
                                        .contains('Not connected')) {
                                      ScaffoldMessenger.of(context)
                                          .removeCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('No device connected'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .removeCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(e.toString()),
                                      ));
                                    }
                                  }
                                }
                              });
                              print(number);
                            },
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '2';
                                print('nada');
                                if (bluetooth.connection != null) {
                                  try {
                                    bluetooth.connection!.output
                                        .add(bluetooth.encodeMessage('1'));
                                  } catch (e) {
                                    if (e
                                        .toString()
                                        .contains('Not connected')) {
                                      ScaffoldMessenger.of(context)
                                          .removeCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('No device connected'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .removeCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(e.toString()),
                                      ));
                                    }
                                  }
                                }
                              });
                              print(number);
                            },
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '3';
                              });
                              print(number);
                            },
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              setState(() {
                                number = '4';
                              });
                              print(number);
                            },
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '5';
                              });
                              print(number);
                            },
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '6';
                              });
                              print(number);
                            },
                            child: Text(
                              '6',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              setState(() {
                                number = '7';
                              });
                              print(number);
                            },
                            child: Text(
                              '7',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '8';
                              });
                              print(number);
                            },
                            child: Text(
                              '8',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                number = '9';
                              });
                              print(number);
                            },
                            child: Text(
                              '9',
                              style: TextStyle(
                                color: Color(0xFFEAC168),
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bluetooth_disabled,
                              size: 30, color: Colors.white),
                          Text("Bluetooth Disabled",
                              style: TextStyle(color: Colors.white)),
                          ElevatedButton(
                              child: Text("Turn on Bluetooth"),
                              onPressed: () {
                                bluetooth.bluetoothSerial.requestEnable();
                              })
                        ]),
                  );
                }
              }),
        ),
      ),
    );
  }
}
