import 'dart:convert';
import 'dart:typed_data';

import 'package:automated_warehouse/constants.dart';
import 'package:automated_warehouse/pages/Forklift/bluetooth/bluetooth.dart';
import 'package:automated_warehouse/pages/Forklift/screens/set_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class Movements extends StatelessWidget {
  const Movements({Key? key}) : super(key: key);

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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SetDevice()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              number = '1';
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('1'));
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
                          },
                          onTapUp: (_) {
                            setState(() {
                              number = null;
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('5'));
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
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_upward,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              number = '3';
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('3'));
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
                          },
                          onTapUp: (_) {
                            setState(() {
                              setState(() {
                                number = null;
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
                            });
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              number = '5';
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('5'));
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
                          },
                          onTapUp: (_) {
                            setState(() {
                              number = null;
                              if (bluetooth.connection != null) {
                                // Stop sending the value
                                // (You may need to add the necessary code here depending on your implementation)
                              }
                            });
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.stop,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              number = '4';
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('4'));
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
                          },
                          onTapUp: (_) {
                            setState(() {
                              number = null;
                              setState(() {
                                number = null;
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
                            });
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              number = '2';
                              if (bluetooth.connection != null) {
                                try {
                                  bluetooth.connection!.output
                                      .add(bluetooth.encodeMessage('2'));
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
                          },
                          onTapUp: (_) {
                            setState(() {
                              number = null;
                              setState(() {
                                number = null;
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
                            });
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_downward,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      number = '6';
                                      if (bluetooth.connection != null) {
                                        try {
                                          bluetooth.connection!.output.add(
                                              bluetooth.encodeMessage('6'));
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
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      number = null;
                                      if (bluetooth.connection != null) {
                                        // Stop sending the value
                                        // (You may need to add the necessary code here depending on your implementation)
                                      }
                                    });
                                  },
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.upload,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      number = '7';
                                      if (bluetooth.connection != null) {
                                        try {
                                          bluetooth.connection!.output.add(
                                              bluetooth.encodeMessage('7'));
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
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      number = null;
                                      if (bluetooth.connection != null) {
                                        // Stop sending the value
                                        // (You may need to add the necessary code here depending on your implementation)
                                      }
                                    });
                                  },
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.download,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
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
    );
  }
}
