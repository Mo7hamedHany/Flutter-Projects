import 'package:flutter/foundation.dart';

class Message {
  final String message;
  String? id;
  Message(this.message, this.id);

  factory Message.fromJason(jsonData) {
    return Message(jsonData['message'], jsonData['id']);
  }
}
