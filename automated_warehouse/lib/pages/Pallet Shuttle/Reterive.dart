import 'dart:convert';
import 'dart:typed_data';

import 'package:automated_warehouse/constants.dart';

import 'package:automated_warehouse/pages/Pallet%20Shuttle/screens/set_dev2.dart';
import 'package:automated_warehouse/pages/Pallet%20Shuttle/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'bluetooth/bluetooth.dart';
import 'screens/set_device.dart';
import 'package:provider/provider.dart';

class Reterive extends StatelessWidget {
  String? address = 'result';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Bluetooth(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Color(primarycolorr),
            buttonTheme: ButtonThemeData(buttonColor: Color(0xff1DF2C7)),
          ),
          home: const MyHomePage(title: 'BluetoothSerial')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool _isButtonUnavailable = false;
  String? number;
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
    return Scaffold(
      backgroundColor: Color(primarycolorr),
      appBar: AppBar(
          title: Text(bluetooth.connection != null
              ? bluetooth.connection!.isConnected
                  ? "Conected to ${bluetooth.device!.name}"
                  : "Bluetooth ON"
              : "Bluetooth"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                icon: Icon(Icons.bluetooth),
                onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SetDev()));
                })
          ]),
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
                    Text(
                      'Enter the number of The shelf \n you want to Reterive the item from: ',
                      style: TextStyle(color: Colors.blue, fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 100, left: 100, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(), color: Colors.white),
                      child: Text(
                        number ??
                            '', // Display the pressed number or an empty string
                        style: TextStyle(
                          color: Colors.black,
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
                                      .add(bluetooth.encodeMessage('A'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                                      .add(bluetooth.encodeMessage('B'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('13'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('14'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('15'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('16'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('17'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('18'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                              print('nada');
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('19'));
                                } catch (e) {
                                  if (e.toString().contains('Not connected')) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                            '9',
                            style: TextStyle(
                              color: Color(0xFFEAC168),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 50)),
                              onPressed: () {
                                setState(() {
                                  number = 'UP';
                                  print('nada');
                                  if (bluetooth.connection != null) {
                                    try {
                                      bluetooth.connection!.output
                                          .add(bluetooth.encodeMessage('6'));
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
                                            content:
                                                Text('No device connected'),
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
                                print('done ya basha');
                              },
                              child: Text(
                                'UP',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 50)),
                              onPressed: () {
                                setState(() {
                                  number = 'Down';
                                  print('nada');
                                  if (bluetooth.connection != null) {
                                    try {
                                      bluetooth.connection!.output
                                          .add(bluetooth.encodeMessage('5'));
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
                                            content:
                                                Text('No device connected'),
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
                                print('done ya basha');
                              },
                              child: Text(
                                'DOWN',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
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
    );
  }
}
